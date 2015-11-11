module Square
  # Square Connect Webhooks.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-webhooks
  class Webhook < Hashie::Mash
    ENDPOINT_BASE = 'webhooks'

    # List webhooks.
    # https://docs.connect.squareup.com/api/connect/v1/#get-webhooks
    #
    # @return [Array<String>] API response.
    def self.list
      response = Service.make_request(endpoint: ENDPOINT_BASE)
      JSON.parse(response)
    end

    # List webhooks.
    # https://docs.connect.squareup.com/api/connect/v1/#put-webhooks
    #
    # @param hooks [Array] Array of hooks to enable.
    #
    # @return [RestClient::Response] API response.
    def self.update(hooks)
      Service.make_request(
        method: 'PUT',
        endpoint: ENDPOINT_BASE,
        request: hooks
      )
    end
  end
end
