require 'spec_helper'

describe Square::Webhook do
  subject { Square::Webhook }
  it_behaves_like 'a listable resource'

  describe '.update' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:params] || args.first[:payload] }
    end

    it 'shoud be defined' do
      expect(subject).to respond_to :update
    end

    it 'should raise an error if called with no arguments' do
      expect { subject.update }.to raise_error ArgumentError
    end

    it 'should make a request to update webhooks' do
      webhook = ['TEST_WEBHOOK']
      params = {test_merchant: 'test merchant'}
      subject.update(webhook, params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'PUT'
        expect(request[:endpoint]).to eq "#{subject.endpoint_base}"
        expect(request[:payload]).to eq webhook

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
