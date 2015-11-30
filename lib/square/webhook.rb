module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-webhooks
  class Webhook < APIResource
    extend Square::APIOperations::List

    endpoint_base 'webhooks'
    data_type Array

    # Had to be overwritten because there is no ID for the update unlike for items and variations
    def self.update(webhook_array, options = {})
      response = Square.make_request(
        method: 'PUT',
        endpoint: self.generate_endpoint_url,
        payload: webhook_array,
        merchant: options[:merchant]
      )

      response = Square.parse_response(response)
      @data_type.new(response)
    end
  end
end
