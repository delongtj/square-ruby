require 'spec_helper'

describe Square::ListResponse do
  class FakeResponse < String
    def headers
      {link: 'a link'}
    end
  end

  let(:resp) {
    FakeResponse.new('[{"test": "value"}]')
  }

  let(:list) {
    class FakeDataType < Square::DataType
      property :test
    end

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
    it 'should iterate' do
      expect(list.count).to eq 1

      list.each do |item|
        expect(item['test']).to eq 'value'
      end
    end
  end

  describe '#more' do
    it 'should return nil if there are no more pages' do
      allow(list).to receive(:has_more?) { false }
      expect(list.more).to be_nil
    end

    it 'should return a new list response if there are more pages' do
      allow(list).to receive(:has_more?) { true }
      allow(Square).to receive(:make_request) { FakeResponse.new('[{"paged": "value"}]') }
      expect(list.more).to be_a Square::ListResponse
    end
  end

  describe '#has_more?' do
    it 'should return false if next_link is nil' do
      expect(list.has_more?).to be false
    end

    it 'should return false if next_link is not nil' do
      class TestListResponse < Square::ListResponse
        attr_accessor :next_link
        def initialize; end
      end
      
      list_resp = TestListResponse.new
      list_resp.next_link = 'adsf'
      expect(list_resp.has_more?).to be true
    end
  end

  describe '#method_missing' do
    it 'should call through to the underlying response object' do
      allow(resp).to receive(:code) { 200 }
      expect(list.code).to eq 200
    end
  end
end
