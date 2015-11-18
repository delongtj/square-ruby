require 'spec_helper'

describe Square do
  it 'should have a version number' do
    expect(Square::VERSION).not_to be nil
  end

  it 'should have an api_host property' do
    expect(Square).to respond_to(:api_host)
  end

  it 'should have an access_token property' do
    expect(Square).to respond_to(:access_token)
  end

  it 'should have an api_version property' do
    expect(Square).to respond_to(:api_version)
  end

  it 'should have a merchant_id property' do
    expect(Square).to respond_to(:merchant_id)
  end

  describe '.make_request' do
    before do
      allow(Square).to receive(:request)
    end

    it 'should throw an error if the access_token is nil' do
      allow(Square).to receive(:access_token) { nil }
      expect { Square.make_request }.to raise_error(StandardError, 'No access token set.')
    end

    it 'should default to GET requests' do
      Square.make_request

      expect(Square).to have_received(:request) do |request|
        expect(request).to include(method: :get)
      end
    end

    it 'should allow you to set the method to anything' do
      Square.make_request(method: :post)

      expect(Square).to have_received(:request) do |request|
        expect(request).to include(method: :post)
      end
    end

    it 'should make a request with the default url and merchant id' do
      Square.make_request

      expect(Square).to have_received(:request) do |request|
        expect(request).to include(url: File.join(Square.api_host, Square.api_version, Square.merchant_id))
      end
    end

    it 'should allow a custom the url' do
      url = 'http://example.com'
      Square.make_request(url: url)

      expect(Square).to have_received(:request) do |request|
        expect(request).to include(url: url)
      end
    end

    it 'should allow a custom merchant id' do
      id = '¯\_(ツ)_/¯'
      Square.make_request(merchant: id, params: {merchant: id}, payload: {merchant: id})

      expect(Square).to have_received(:request) do |request|
        expect(request).to include(url: File.join(Square.api_host, Square.api_version, id))

        # Also make sure we didn't include things we're not supposed to include.
        expect(request).not_to include(:merchant)
        expect(request[:params]).not_to be
        expect(request[:payload]).not_to be
      end
    end

    it 'should generate the correct default headers' do
      default_headers = Square.request_headers(Square.access_token)
      Square.make_request

      expect(Square).to have_received(:request) do |request|
        expect(request[:headers]).to eq default_headers
      end
    end

    it 'should allow custom headers' do
      headers = {test: 'value'}
      Square.make_request(headers: headers)

      expect(Square).to have_received(:request) do |request|
        expect(request[:headers]).to include(headers)
      end
    end

    it 'should allow a custom payload' do
      payload = {test: 'value'}
      Square.make_request(payload: payload)

      expect(Square).to have_received(:request) do |request|
        parsed_payload = JSON.parse(request[:payload])
        expect(parsed_payload).to eq JSON.parse(JSON.generate(payload))
      end
    end

    it 'should allow a custom params' do
      params = {test: 'value'}
      Square.make_request(params: params)

      expect(Square).to have_received(:request) do |request|
        expect(request[:headers][:params]).to eq params
      end
    end
  end

  describe '.request' do
  end

  describe '.parse_response' do
    it 'should parse a json string' do
      obj = {test: "value"}
      resp = Square.parse_response(JSON.generate(obj))
      expect(resp).to eq obj

      # Make sure invalid json raises an error.
      expect { Square.parse_response('what') }.to raise_error(JSON::ParserError)
    end
  end

  describe '.batch' do
  end

  describe '.request_headers' do
    it 'should return the default request headers' do
      default_headers = {
        authorization: "Bearer #{Square.access_token}",
        accept: 'application/json',
        content_type: 'application/json'
      }

      expect(Square.request_headers(Square.access_token)).to eq default_headers
    end
  end
end
