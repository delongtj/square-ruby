module Square
  module APIOperations
    module Delete
      # Delete a resource.
      #
      # @param id [String] ID of the resource to delete.
      def delete(params, object_id, parent_id = nil)
        request = {
          method: 'DELETE',
          endpoint: self.generate_endpoint_url(object_id, parent_id),
          payload: params
        }

        response = Square.make_request(request)
        response = JSON.parse(response)
      end
    end
  end
end
