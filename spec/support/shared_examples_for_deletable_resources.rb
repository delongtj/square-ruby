shared_examples 'a deletable resource' do
  describe '.delete' do
    before do
      allow(Square).to receive(:make_request) { |*args| args[0] }
      allow(Square).to receive(:parse_response)
    end

    it 'shoud work' do
      expect(subject).to respond_to :delete
    end

    it 'should make a request with the correct default parameters' do
      params = {shouldnt_need_this: 'nope'}

      subject.delete(params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'DELETE'
        expect(request[:endpoint]).to eq subject.endpoint_base
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
