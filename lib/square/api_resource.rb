module Square
  class APIResource
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

    # List resource.
    #
    # @param params [Hash] Hash of query params.
    def self.list(params = {})
      request = {
        method: 'GET',
        endpoint: self.generate_endpoint_url,
        params: params
      }

      # The list endpoint makes use of the ListResponse to handle paging.
      response = Square.make_request(request)
      Square::ListResponse.new(response, @data_type)
    end

    # Retrieve a resource.
    #
    # @param id [String] ID of the resource to retrieve.
    def self.retrieve(id, params = {})
      request = {
        method: 'GET',
        endpoint: self.generate_endpoint_url(nil, id),
        params: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      @data_type.new(response)
    end

    # Create resource.
    #
    # @param params [Hash] Object params.
    def self.create(params, parent_id = nil)
      path = @endpoint_base
      if parent_id
        path = File.join(@nested_under, parent_id, path)
      end

      response = Square.post(path, params)

      @data_type.new(response)
    end

    # Update a resource.
    #
    # @param params [Hash] Update data.
    def self.update(params, id, parent_id = nil)
      if parent_id
        path = File.join(@nested_under, parent_id, @endpoint_base, id)
      else
        path = File.join(@endpoint_base, id)
      end

      response = Square.put(path, params)
      @data_type.new(response)
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
