# Libs.
require 'rest-client'
require 'hashie'
require 'open-uri'
require 'net/http/post/multipart'

# Version.
require 'square/version'

# Data types.
require 'square/data_type'
require 'square/data_types/money'
require 'square/data_types/device'
require 'square/data_types/payment_discount'
require 'square/data_types/payment_tax'
require 'square/data_types/payment_modifier'
require 'square/data_types/payment_item_detail'
require 'square/data_types/payment_itemization'
require 'square/data_types/refund'
require 'square/data_types/tender'
require 'square/data_types/payment'
require 'square/data_types/fee'
require 'square/data_types/item_image'
require 'square/data_types/category'
require 'square/data_types/item_variation'
require 'square/data_types/modifier_list'
require 'square/data_types/modifier_option'
require 'square/data_types/item'

# API Resources.
require 'square/list_response'
require 'square/api_resource'
require 'square/item'
require 'square/payment'
require 'square/variation'
require 'square/webhook'

RestClient.log = Logger.new(STDOUT)

module Square
  @api_host = 'https://connect.squareup.com'
  @access_token = nil

  class << self
    attr_accessor :api_host, :access_token
  end

  # Make an API call to Square.
  #
  # @param options [Hash] Hash of options. Expects something like this:
  #
  # {
  #   method: 'POST',
  #   endpoint: 'items',
  #   request: {...}
  # }
  #
  # @return [RestClient::Response]
  def self.make_request(options = {}, &block)
    if access_token.nil?
      raise StandardError.new('No access token set.')
    end

    # Allow passing in a fully formed URL. Default to auto detecting
    # the merchant ID.
    # https://docs.connect.squareup.com/api/connect/v1/#navsection-merchant
    merchant = options[:merchant] || 'me'
    url = options[:url] || File.join(api_host, 'v1', merchant, options[:endpoint])

    # Build up the RestClient request object.
    request_params = {
      # Allow passing in headers.
      headers: request_headers(access_token).merge(options[:headers] || {}),

      # Default to a GET request.
      method: (options[:method] || :get).downcase.to_sym,

      # URL.
      url: url
    }

    # Merge in a payload hash.
    payload = options[:payload] || nil

    if payload.present? && payload.respond_to?(:to_json)
      payload = payload.to_json
      request_params.merge!(payload: payload)
    end

    # Merge in a params hash.
    params = options[:params] || nil

    if params.present? && !params.empty?
      request_params[:headers].merge!(params: params)
    end

    # Perform the request.
    RestClient::Request.execute(request_params, &block)
  end

  def self.post(path, params, &block)
    request('POST', path, params, &block)
  end

  def self.put(path, params, &block)
    request('PUT', path, params, &block)
  end

  # {
  #   method: "POST",
  #   path: "categories",
  #   body: {
  #     "name": "Beverages"
  #   }
  # }
  def self.batch(requests = [{}], options = {}, &block)
    merchant = options[:merchant] || 'me'

    requests = requests.map {|request|
      path = request.delete(:path)
      request[:relative_path] = File.join('/', 'v1', merchant, path)
      request[:access_token]  = access_token
      request[:request_id]    ||= SecureRandom.uuid
      request
    }

    request_params = {
      headers: request_headers(access_token),
      method: :post,
      url: File.join(api_host, 'v1', 'batch'),
      payload: {
        requests: requests
      }.to_json
    }


    begin
      response = RestClient::Request.execute(request_params, &block)
      JSON.parse(response)
    rescue RestClient::Exception => e
      puts e.http_body
      raise e
    end
  end

  def self.request(method, path, params, &block)
    begin
      response = make_request({method: method, endpoint: path, payload: params}, &block)
      JSON.parse(response)
    rescue RestClient::Exception => e
      puts e.http_body
      raise e
    end
  end

  # Get the request headers.
  #
  # @param [String] Square access token.
  #
  # @return [Hash] Hash of headers.
  def self.request_headers(access_token)
    {
      authorization: "Bearer #{access_token}",
      accept: 'application/json',
      content_type: 'application/json'
    }
  end
end
