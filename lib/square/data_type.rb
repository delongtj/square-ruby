module Square
  class DataType < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion

    # List payments.
    # https://docs.connect.squareup.com/api/connect/v1/#get-payments
    #
    # @return [Array<Square::Payment>] API response.
    def self.list(options = {})
      request = {
        endpoint: ENDPOINT_BASE,
        params: options
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      response.map {|record| new(data_type)}
    end

    # Get a payment.
    # https://docs.connect.squareup.com/api/connect/v1/#get-paymentid
    #
    # @return [Square::Payment] Payment.
    def self.retrieve(id)
      response = Service.make_request(endpoint: "#{ENDPOINT_BASE}/#{id}")
      response = JSON.parse(response)
      new(response)
    end
  end
end
