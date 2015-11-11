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

    # Create resource.
    #
    # @param params [Hash] Object params.
    def self.create(*ids, params)
      request = {
        method: 'POST',
        endpoint: self.generate_endpoint_url(*ids),
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
        endpoint: self.generate_endpoint_url,
        params: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      response.map {|record| @data_type.new(record)}
    end

    # Update a resource.
    #
    # @param params [Hash] Update data.
    def self.update(*ids, params)
      request = {
        method: 'PUT',
        endpoint: self.generate_endpoint_url(*ids),
        payload: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      @data_type.new(response)
    end

    # Retrieve a resource.
    #
    # @param id [String] ID of the resource to retrieve.
    def self.retrieve(id, params)
      request = {
        method: 'GET',
        endpoint: self.generate_endpoint_url(nil, id),
        params: params
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
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
    # @param parent_id [String] ID of the 'parent' object.
    # @param object_id [String] ID of the 'object'.
    #
    # @return [String] Endpoint URL.
    def self.generate_endpoint_url(parent_id = nil, object_id = nil)
      File.join([@nested_under, parent_id, @endpoint_base, object_id].compact)
    end
  end
end
