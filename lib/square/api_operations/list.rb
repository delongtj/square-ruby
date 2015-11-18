module Square
  module APIOperations
    module List
      # List resource.
      #
      # @param params [Hash] Hash of query params. Optional.
      #
      # @return [Square::ListResponse]
      def list(params = {})
        # The list endpoint makes use of the ListResponse to handle paging.
        response = Square.make_request(
          method: 'GET',
          endpoint: self.generate_endpoint_url,
          params: params
        )

        Square::ListResponse.new(response, @data_type)
      end
    end
  end
end
