module Square
  # Square Connect Webhooks.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-webhooks
  class Webhook < APIResource
    endpoint_base 'webhooks'
    data_type Array
  end
end
