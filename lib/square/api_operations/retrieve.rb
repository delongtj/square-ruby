module Square
  module APIOperations
    module Retrieve
      # Retrieve a resource.
      #
      # @param id [String] ID of the resource to retrieve.
      # @param params [Hash] Hash of query params. Optional.
      #
      # @return [Square::DataType]
      def retrieve(id, params = {})
        response = Square.make_request(
          endpoint: self.generate_endpoint_url(id),
          params: params
        )

        response = Square.parse_response(response)
        @data_type.new(response)
      end
    end
  end
end
