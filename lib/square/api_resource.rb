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

    # Create resource.
    #
    # @param params [Hash] Object params.
    def self.create(params = {})
      request = {
        method: 'POST',
        endpoint: instance_variable_get('@endpoint_base'),
        payload: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      @data_type.new(response)
    end

    # List resource.
    #
    # @param params [Hash] Hash of query params.
    def self.list(params = {})
      request = {
        method: 'GET',
        endpoint: instance_variable_get('@endpoint_base'),
        params: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      response.map {|record| @data_type.new(record)}
    end

    # Update a resource.
    #
    # @param params [Hash] Update data.
    def self.update(params = {})
      request = {
        method: 'PUT',
        endpoint: 'something',
        payload: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      @data_type.new(response)
    end

    # Retrieve a resource.
    #
    # @param id [String] ID of the resource to retrieve.
    def self.retrieve(id)
      request = {
        method: 'GET',
        endpoint: "#{instance_variable_get('@endpoint_base')}/#{id}"
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      @data_type.new(response)
    end

    # Delete a resource.
    #
    # @param id [String] ID of the resource to delete.
    def self.delete(id)
      request = {
        method: 'DELETE',
        endpoint: "#{instance_variable_get('@endpoint_base')}/#{id}"
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
    end
  end
end
