module Square
  module APIOperations
    module Update
      # Update a resource.
      #
      # @param id [String] ID of the resource to update. Required.
      # @param parent_id [String] ID of the 'parent' to update. Optional.
      # @param params [Hash] Request params. Required.
      #
      # @return [Square::DataType]
      def update(id, *args)
        if args.count == 2
          if !nested_under.nil?
            parent_id = args[0]
            params = args[1]
          else
            parent_id = nil
            params = args[0]
          end
        else
          if !nested_under.nil?
            parent_id = args[0]
            params = args[1]
          else
            parent_id = nil
            params = args[0]
          end
        end

        if params.nil?
          raise ArgumentError.new("`params` is a required argument.")
        end

        response = Square.make_request(
          method: 'PUT',
          endpoint: self.generate_endpoint_url(id, parent_id),
          payload: params
        )

        response = Square.parse_response(response)
        @data_type.new(response)
      end
    end
  end
end
