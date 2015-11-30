module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-webhooks
  class Webhook < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Update

    endpoint_base 'webhooks'
    data_type Array

    # TODO refactor this if possible 
    # Had to be overwritten because there is no ID for the update unlike for items and variations
    def self.update(webhook_array, options = {})
      if Square.access_token.nil?
        raise StandardError.new('No access token set.')
      end

      # default to put
      method = (options[:method] || :put).downcase.to_sym

      # Allow passing in a fully formed URL.
      if !options[:url].nil?
        url = options[:url]
      else
        # Special handling of the merchant param.
        if !options[:merchant].nil?
          merchant = options.delete(:merchant)
        end

        path_args = [Square.api_host, Square.api_version, merchant, 'webhooks'].compact
        url = File.join(path_args)
      end

      # Build up the RestClient request object.
      request_params = {
        headers: Square.request_headers(Square.access_token).merge(options[:headers] || {}),
        method: method,
        url: url
      }

      payload = webhook_array

      if !payload.nil? && payload.respond_to?(:to_json) && !payload.empty?
        payload = payload.to_json
        request_params.merge!(payload: payload)
      end

      # Merge in a params hash.
      params = options[:params] || nil

      if !params.nil? && !params.empty?
        request_params[:headers].merge!(params: params)
      end

      # Perform the request.
      response = Square.request(request_params)

      Square.parse_response(response)
    end
  end
end
