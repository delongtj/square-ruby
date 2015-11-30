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
require 'square/data_types/settlement_entry'
require 'square/data_types/settlement'
require 'square/data_types/coordinates'
require 'square/data_types/global_address'
require 'square/data_types/phone_number'
require 'square/data_types/merchant_location_details'
require 'square/data_types/merchant'
require 'square/data_types/discount'
require 'square/data_types/inventory_entry'
require 'square/data_types/bank_account'

# API Operations.
require 'square/list_response'
require 'square/api_operations/list'
require 'square/api_operations/retrieve'
require 'square/api_operations/create'
require 'square/api_operations/update'
require 'square/api_operations/delete'

# API Resources.
require 'square/api_resource'
require 'square/category'
require 'square/bank_accounts'
require 'square/discount'
require 'square/item'
require 'square/merchant'
require 'square/payment'
require 'square/inventory'
require 'square/fee'
require 'square/refund'
require 'square/settlement'
require 'square/variation'
require 'square/webhook'

RestClient.log = Logger.new(STDOUT)

module Square
  @api_host = 'https://connect.squareup.com'
  @access_token = nil
  @api_version = 'v1'
  @merchant_id = 'me'

  class << self
    attr_accessor :api_host, :access_token, :api_version, :merchant_id
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

    # Default to a GET request.
    method = (options[:method] || :get).downcase.to_sym

    # Allow passing in a fully formed URL.
    if !options[:url].nil?
      url = options[:url]
    else
      # Special handling of the merchant param.
      if !options[:params].nil? && options[:params].key?(:merchant)
        merchant = options[:params].delete(:merchant)
      end

      if !options[:payload].nil? && options[:payload].is_a?(Hash) && options[:payload].key?(:merchant)
        merchant = options[:payload].delete(:merchant)
      end

      if !options[:merchant].nil?
        merchant = options[:merchant]
      end

      merchant = merchant || merchant_id

      path_args = [api_host, api_version, merchant, options[:endpoint]].compact
      url = File.join(path_args)
    end

    # Build up the RestClient request object.
    request_params = {
      headers: request_headers(access_token).merge(options[:headers] || {}),
      method: method,
      url: url
    }

    # Merge in a payload hash.
    payload = options[:payload] || nil

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
    self.request(request_params, &block)
  end

  # Request helper. Makes testing and switching out the http client easy.
  def self.request(request, &block)
    RestClient::Request.execute(request, &block)
  end

  # Parse a response.
  #
  # @param response [RestClient::Response]
  #
  # @return [#to_json]
  def self.parse_response(response)
    begin
      JSON.parse(response, symbolize_names: true)
    rescue JSON::ParserError => e
      Logger.new(STDOUT).error(e.message)
      raise e
    end
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
      Logger.new(STDOUT).error(e.http_body)
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
