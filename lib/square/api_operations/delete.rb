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
      def delete(id, *args)
        if args.count == 2
          parent_id = args[0]
          params = args[1]
        else
          if !nested_under.nil?
            parent_id = args[0]
            params = nil
          else
            parent_id = nil
            params = args[0]
          end
        end

        # If this item is nested_under something, the parent_id is required.
        if !nested_under.nil? && parent_id.nil?
          raise ArgumentError.new("`parent_id` is required because this resource is nested under: #{nested_under}.")
        end

        response = Square.make_request(
          method: 'DELETE',
          endpoint: self.generate_endpoint_url(id, parent_id),
          payload: params
        )

        Square.parse_response(response)
      end
    end
  end
end
