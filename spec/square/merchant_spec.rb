require 'spec_helper'

describe Square::Merchant do
  subject { Square::Merchant }

  describe '.retrieve' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'should raise an error when called with the wrong arguments' do
      expect { subject.retrieve }.not_to raise_error
      expect { subject.retrieve('merchant-id') }.not_to raise_error
      expect { subject.retrieve('merchant-id', {}) }.to raise_error ArgumentError
    end

    it 'should adjust inventory' do
      merchant_id = 'merchant-id'
      params = {}

      resp = subject.retrieve(merchant_id)
      expect(resp).to be_a subject.data_type

      expect(Square).to have_received(:make_request) do |request|
        # This will be nil here because we're defaulting to a GET request.
        expect(request[:method]).to be_nil
        expect(request[:merchant]).to eq merchant_id
        expect(request[:endpoint]).to be_nil
        expect(request[:payload]).to be_nil
        expect(request[:params]).to be_nil

        # Assign the request back to params so we can test that parse_response
        # got the arguments we expect.
        params = request
      end

      expect(Square).to have_received(:parse_response) do |response|
        expect(response).to eq params
      end
    end
  end
end
