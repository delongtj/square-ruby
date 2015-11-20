require 'spec_helper'

describe Square::Inventory do
  subject { Square::Inventory }
  it_behaves_like 'a listable resource'

  describe '.adjust' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'should raise an error when called with the wrong arguments' do
      expect { subject.adjust }.to raise_error ArgumentError
      expect { subject.adjust('variation-id') }.not_to raise_error
      expect { subject.adjust('variation-id', {test_key: 'test value'}) }.not_to raise_error
    end

    it 'should adjust inventory' do
      variation_id = 'variation-id'
      params = {test_key: 'test value'}

      item = subject.adjust(variation_id, params)
      expect(item).to be_a subject.data_type

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'POST'
        expect(request[:endpoint]).to eq File.join subject.endpoint_base, variation_id
        expect(request[:payload]).to eq params
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
