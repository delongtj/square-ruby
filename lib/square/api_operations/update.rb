module Square
  module APIOperations
    module Update
      # Update a resource.
      #
      # @param id [String] ID of the resource to update.
      # @param parent_id [String] ID of the 'parent' to update. Optional.
      # @param params [Hash] Payload. Optional.
      def update(*args)
        # Extract args.
        case args.count
          when 3
            id, parent_id, params = args
          when 2
            id, params = args
          else
            raise StandardError.new('Unknown number of arguments.')
        end

        # Build the endpoint.
        endpoint = File.join([@nested_under, parent_id, @endpoint_base, id].compact)

        request = {
          method: 'PUT',
          endpoint: endpoint,
          params: params
        }

        response = Square.make_request(request)
        response = JSON.parse(response)
        @data_type.new(response)
      end
    end
  end
end
