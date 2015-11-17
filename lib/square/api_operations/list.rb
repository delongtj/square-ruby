module Square
  module APIOperations
    module List
      # List resource.
      #
      # @param params [Hash] Hash of query params.
      def list(params)
        request = {
          method: 'GET',
          endpoint: self.generate_endpoint_url,
          params: params
        }

        # The list endpoint makes use of the ListResponse to handle paging.
        response = Square.make_request(request)
        Square::ListResponse.new(response, @data_type)
      end
    end
  end
end
