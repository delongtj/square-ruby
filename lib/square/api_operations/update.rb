module Square
  module APIOperations
    module Update
      # Update a resource.
      #
      # @param id [String] ID of the resource to update.
      # @param parent_id [String] ID of the 'parent' to update. Optional.
      # @param params [Hash] Request params.
      #
      # @return [Square::DataType]
      def update(*args)
        id = args[0]

        if args.count == 3
          parent_id = args[1]
          params = args[2]
        elsif args.count == 2
          parent_id = nil
          params = args[1]
        elsif
          raise ArgumentError.new('`id` and `params` are required arguments.')
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
