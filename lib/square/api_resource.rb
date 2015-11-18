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

    private

    # Generate an endpoint based on provided arguments.
    #
    # @param id [String] Resource ID. Optional.
    # @param parent_id [String] ID of the 'parent' resource. Optional.
    #
    # @return [String] Endpoint URL.
    def self.generate_endpoint_url(*args)
      id, parent_id = args
      File.join([@nested_under, parent_id, @endpoint_base, id].compact)
    end
  end
end
