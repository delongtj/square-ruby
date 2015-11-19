shared_examples 'an updatable resource' do
  describe '.update' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:params] }
    end

    it 'shoud work' do
      expect(subject).to respond_to :update
    end

    it 'should raise an error if called with no arguments' do
      expect { subject.update }.to raise_error ArgumentError
      expect { subject.update('test-id') }.to raise_error ArgumentError
    end

    it 'should make a request for a single id' do
      id = 'test-id'
      params = {test_key: 'test value'}

      subject.update(id, params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'PUT'
        expect(request[:endpoint]).to eq "#{subject.endpoint_base}/#{id}"
        expect(request[:payload]).to eq params

        # Assign the request back to params so we can test that parse_response
        # got the arguments we expect.
        params = request
      end

      expect(Square).to have_received(:parse_response) do |response|
        expect(response).to eq params
      end
    end

    it 'should make a request for an id and a parent_id' do
      id = 'test-id'
      parent_id = 'parent-id'
      params = {test_key: 'test value'}

      subject.update(id, parent_id, params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'PUT'
        # This is probably going to break when tested with something that set nested_under.
        expect(request[:endpoint]).to eq "#{parent_id}/#{subject.endpoint_base}/#{id}"
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
