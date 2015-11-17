module Square
  class APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve
    extend Square::APIOperations::Create
    extend Square::APIOperations::Update

    # Set a data_type property for this resource.
    def self.data_type(data_type)
      @data_type = data_type
    end

    # Set an endpoint base for this resource.
    def self.endpoint_base(base)
      @endpoint_base = base
    end

    # Set a property for nested resources.
    def self.nested_under(parent)
      @nested_under = parent
    end

    # Delete a resource.
    #
    # @param id [String] ID of the resource to delete.
    def self.delete(*ids)
      request = {
        method: 'DELETE',
        endpoint: self.generate_endpoint_url(*ids)
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
    end

    private

    # Generate an endpoint for nested resources
    #
    # @param parent_id [String] ID of the 'parent' object. Optional.
    # @param object_id [String] ID of the 'object'. Optional.
    #
    # @return [String] Endpoint URL.
    def self.generate_endpoint_url(*args)
      case args.size
        when 0 then @endpoint_base
        when 1 then File.join(@endpoint_base, args[0])
      else
        File.join([@nested_under, args[0], @endpoint_base, args[1]].compact)
      end
    end
  end
end
