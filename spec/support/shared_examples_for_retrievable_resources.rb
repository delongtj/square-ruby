shared_examples 'a retrievable resource' do
  describe '.retrieve' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:params] }
    end

    it 'shoud work' do
      expect(subject).to respond_to :retrieve
    end

    it 'should make a request with the correct default parameters' do
      id = 'test-id'
      params = {}

      subject.retrieve(id)

      expect(Square).to have_received(:make_request) do |request|
        # In this case we're expecting this to be nil because we've stubbed out
        # Square.make_request.
        expect(request[:method]).to be_nil
        expect(request[:endpoint]).to eq "#{subject.endpoint_base}/#{id}"
        expect(request[:payload]).to be_nil

        # Assign the request back to params so we can test that parse_response
        # got the arguments we expect.
        params = request
      end

      expect(Square).to have_received(:parse_response) do |response|
        expect(response).to eq params
      end
    end

    it 'should make a request with passed in params' do
      id = 'test-id'
      params = {id: 'value'}

      resp = subject.retrieve(id, params)
      expect(resp).to be_a subject.data_type
      expect(resp.id).to eq params[:id]

      expect(Square).to have_received(:make_request) do |request|
        # In this case we're expecting this to be nil because we've stubbed out
        # Square.make_request.
        expect(request[:method]).to be_nil
        expect(request[:endpoint]).to eq "#{subject.endpoint_base}/#{id}"
        expect(request[:params]).to eq params

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
