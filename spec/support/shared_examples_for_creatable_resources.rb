shared_examples 'a creatable resource' do
  describe '.create' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'shoud work' do
      expect(subject).to respond_to :create
    end

    it 'should make a request with the correct default parameters' do
      params = {}

      subject.create

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'POST'
        expect(request[:endpoint]).to eq subject.endpoint_base
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
      params = {test: 'value'}

      subject.create(params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'POST'
        expect(request[:endpoint]).to eq subject.endpoint_base
        expect(request[:payload]).to eq params
      end
    end

    it 'should make a request with passed in id and params' do
      id = 'test-id'
      params = {id: 'value'}

      resp = subject.create(id, params)
      expect(resp).to be_a subject.data_type
      expect(resp.id).to eq params[:id]

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'POST'
        expect(request[:endpoint]).to eq "#{id}/#{subject.endpoint_base}"
        expect(request[:payload]).to eq params
      end
    end
  end
end
