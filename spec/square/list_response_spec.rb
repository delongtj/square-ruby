require 'spec_helper'

describe Square::ListResponse do
  let(:list) {
    # Fake out a RestClient::Response
    class FakeResponse < String
      def headers
        {link: 'a link'}
      end
    end

    class FakeDataType < Square::DataType
      property :test
    end

    resp = FakeResponse.new('[{"test": "value"}]')
    list = Square::ListResponse.new(resp, FakeDataType)
  }

  it 'should have a LINK_REGEXP constant' do
    expect(Square::ListResponse::LINK_REGEXP).to be_a Regexp
  end

  it 'should include Enumerable' do
    expect(Square::ListResponse.included_modules).to include Enumerable
  end

  describe '#initialize' do
    it 'should raise an error if response and data_type arent provided' do
      expect { Square::ListResponse.new }.to raise_error ArgumentError
      expect { Square::ListResponse.new('something') }.to raise_error ArgumentError
    end

    it 'should return an array of data types for a valid response' do
      expect(list.count).to eq 1
      expect(list).to be_a Square::ListResponse
    end
  end

  describe '#each' do
    pending
  end

  describe '#more' do
    pending
  end

  describe '#has_more?' do
    pending
  end
end
