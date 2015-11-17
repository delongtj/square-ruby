module Square
  module APIOperations
    module Delete
      # Delete a resource.
      #
      # @param id [String] ID of the resource to update.
      # @param parent_id [String] ID of the 'parent' to update. Optional.
      # @param params [Hash] Payload. Optional.
      #
      # @return [#to_json]
      def delete(*args, params)
        id, parent_id = args

        request = {
          method: 'DELETE',
          endpoint: self.generate_endpoint_url(id, parent_id),
          payload: params
        }

        response = Square.make_request(request)
        response = JSON.parse(response)
      end
    end
  end
end
