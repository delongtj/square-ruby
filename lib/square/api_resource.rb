module Square
  class APIResource
    # Set a data_type property for this resource.
    def self.data_type(data_type)
      instance_variable_set('@data_type', data_type)
    end

    # Set an endpoint base for this resource.
    def self.endpoint_base(base)
      instance_variable_set('@endpoint_base', base)
    end

    # List resource.
    #
    # @param params [Hash] Hash of query params.
    def self.list(params = {})
      request = {
        endpoint: instance_variable_get('@endpoint_base'),
        params: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      response.map {|record| @data_type.new(record)}
    end

    # Retrieve a resource.
    #
    # @param id [String] ID of the resource to retrieve.
    def self.retrieve(id)
      response = Square.make_request(endpoint: "#{instance_variable_get('@endpoint_base')}/#{id}")
      response = JSON.parse(response)
      ap response
      @data_type.new(response)
    end
  end
end
