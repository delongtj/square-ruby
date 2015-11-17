module Square
  module APIOperations
    module Update
      # Update a resource.
      #
      # @param id [String] ID of the resource to update.
      # @param parent_id [String] ID of the 'parent' to update. Optional.
      # @param params [Hash] Payload. Optional.
      #
      # @return [DataType]
      def update(*args, params)
        id, parent_id = args

        request = {
          method: 'PUT',
          endpoint: self.generate_endpoint_url(id, parent_id),
          payload: params
        }

        response = Square.make_request(request)
        response = JSON.parse(response)
        @data_type.new(response)
      end
    end
  end
end
