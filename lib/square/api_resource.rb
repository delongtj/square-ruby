module Square
  class APIResource
    # Set a data_type property for this resource.
    #
    # @param data_type [Square::DataType] Data type. Optional.
    #
    # @return [Square::DataType]
    def self.data_type(data_type = nil)
      if !data_type.nil?
        @data_type = data_type
      end

      @data_type
    end

    # Set an endpoint base for this resource.
    #
    # @param base [String] API endpoint. Optional.
    #
    # @return [String]
    def self.endpoint_base(base = nil)
      if !base.nil?
        @endpoint_base = base
      end

      @endpoint_base
    end

    # Set a property for nested resources.
    #
    # @param parent [String] API 'parent' endpoint. Optional.
    #
    # @return [String]
    def self.nested_under(parent = nil)
      if !parent.nil?
        @nested_under = parent
      end

      @nested_under
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
