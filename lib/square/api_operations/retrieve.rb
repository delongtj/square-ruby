module Square
  module APIOperations
    module Retrieve
      # Retrieve a resource.
      #
      # @param id [String] ID of the resource to retrieve.
      def retrieve(id, params = {})
        request = {
          endpoint: self.generate_endpoint_url(nil, id),
          params: params
        }

        response = Square.make_request(request)
        response = JSON.parse(response)
        @data_type.new(response)
      end
    end
  end
end
