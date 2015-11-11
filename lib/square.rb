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
require 'square/api_resource'
require 'square/item'
require 'square/payment'
require 'square/variation'
require 'square/webhook'

# RestClient.log = Logger.new(STDOUT)

module Square
  @api_host = 'https://connect.squareup.com'
  @next_link = nil
  @access_token = nil

  # RegExp used for parsing Link headers when the API paginates data. I don't
  # care about rel attributes right now because this is the only thing this is
  # used for.
  LINK_REGEXP = /^<([ -~]+)>;/i

  class << self
    attr_accessor :api_host, :access_token, :next_link
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

    # Make the request.
    response = RestClient::Request.execute(request_params, &block)

    # Detect a Link header.
    if response.headers[:link].present?
      match = LINK_REGEXP.match(response.headers[:link])
      self.next_link = match.captures[0]
    else
      self.next_link = nil
    end

    response
  end

  # Get the next page, if available.
  def self.next
    if next_link.nil?
      return nil
    end

    self.make_request(url: next_link)
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
