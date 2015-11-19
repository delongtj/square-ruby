module Square
  module APIOperations
    module Create
      # Create resource.
      #
      # @param parent_id [String] ID of the 'parent' to update. Optional.
      # @param params [Hash] Payload. Optional.
      #
      # @return [DataType]
      def create(*args)
        if args.count == 1
          parent_id = nil
          params = args[0]
        elsif args.count == 2
          parent_id = args[0]
          params = args[1]
        end

        # If this item is nested_under something, the parent_id is required.
        if !nested_under.nil? && parent_id.nil?
          raise ArgumentError.new("parent_id is required because this resource is nested under: #{nested_under}.")
        end

        response = Square.make_request(
          method: 'POST',
          endpoint: self.generate_endpoint_url(nil, parent_id),
          payload: params
        )

        response = Square.parse_response(response)
        @data_type.new(response)
      end
    end
  end
end
