module Square
  module APIOperations
    module Create
      # Create resource.
      #
      # @param params [Hash] Object params.
      def create(params, parent_id = nil)
        path = @endpoint_base

        if parent_id
          path = File.join(@nested_under, parent_id, path)
        end

        response = Square.post(path, params)
        @data_type.new(response)
      end
    end
  end
end
