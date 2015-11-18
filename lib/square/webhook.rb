module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-webhooks
  class Webhook < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Update

    endpoint_base 'webhooks'
    data_type Array
  end
end
