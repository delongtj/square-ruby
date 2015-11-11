module Square
  class DataType < Hashie::Dash
    include Hashie::Extensions::Dash::Coercion
    include Hashie::Extensions::IndifferentAccess

    # List payments.
    # https://docs.connect.squareup.com/api/connect/v1/#get-payments
    #
    # @return [Array<Square::Payment>] API response.
    def self.list(options = {})
      request = {
        endpoint: self.endpoint_base,
        params: options
      }

      response = Square.make_request(request)
      response = JSON.parse(response)
      # ap response
      response.map {|record| new(record.deep_symbolize_keys)}
    end

    # Get a payment.
    # https://docs.connect.squareup.com/api/connect/v1/#get-paymentid
    #
    # @return [Square::Payment] Payment.
    def self.retrieve(id)
      response = Service.make_request(endpoint: "#{self.endpoint_base}/#{id}")
      response = JSON.parse(response)
      new(response)
    end
  end
end
