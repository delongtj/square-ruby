module Square
  module APIOperations
    module Update
      # Update a resource.
      #
      # @param params [Hash] Update data.
      def update(params, id, parent_id = nil)
        if parent_id
          path = File.join(@nested_under, parent_id, @endpoint_base, id)
        else
          path = File.join(@endpoint_base, id)
        end

        response = Square.put(path, params)
        @data_type.new(response)
      end
    end
  end
end
