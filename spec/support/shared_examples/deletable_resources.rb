shared_examples 'a deletable resource' do
  describe '.delete' do
    before do
      allow(Square).to receive(:make_request) { |*args| args[0] }
      allow(Square).to receive(:parse_response)
    end

    it 'shoud be defined' do
      expect(subject).to respond_to :delete
    end

    it 'should raise an error when called with incorrect arguments' do
      expect { subject.delete }.to raise_error ArgumentError
      expect { subject.delete('test-id') }.not_to raise_error
    end

    it 'should make a request with the correct default parameters' do
      id = 'id'
      params = {}

      subject.delete(id)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'DELETE'
        expect(request[:endpoint]).to eq File.join(subject.endpoint_base, id)
        expect(request[:payload]).to be_nil

        # Assign the request back to params so we can test that parse_response
        # got the arguments we expect.
        params = request
      end

      expect(Square).to have_received(:parse_response) do |response|
        expect(response).to eq params
      end
    end

    it 'should allow passing params' do
      id = 'id'
      params = {test_key: 'test value'}

      subject.delete(id, params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'DELETE'
        expect(request[:endpoint]).to eq File.join(subject.endpoint_base, id)
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
