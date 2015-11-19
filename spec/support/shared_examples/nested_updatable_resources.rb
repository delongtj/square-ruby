require 'spec_helper'

shared_examples 'a nested updatable resource' do
  describe '.update' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'should be defined' do
      expect(subject).to respond_to :update
    end

    it 'should raise an error when called with incorrect arguments' do
      expect { subject.update }.to raise_error ArgumentError
      expect { subject.update('test-id') }.to raise_error ArgumentError
      expect { subject.update('test-id', 'parent-id') }.to raise_error ArgumentError
      expect { subject.update('test-id', 'parent-id', {test_key: 'value'}) }.not_to raise_error
    end

    it 'should create a nested resource' do
      id = 'id'
      parent_id = 'parent-id'
      params = {test_key: 'test value'}

      subject.update(id, parent_id, params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'PUT'
        expect(request[:endpoint]).to eq File.join(subject.nested_under, parent_id, subject.endpoint_base, id)
        expect(request[:payload]).to eq params

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
