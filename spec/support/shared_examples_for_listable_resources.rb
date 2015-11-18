shared_examples 'a listable resource' do
  describe '.list' do
    let(:response) { 'test response' }

    before do
      allow(Square).to receive(:make_request) { response }
      allow(Square::ListResponse).to receive(:new)
    end

    it 'shoud work' do
      expect(subject).to respond_to :list
    end

    it 'should make a request with the correct default parameters' do
      subject.list

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'GET'
        expect(request[:endpoint]).to eq subject.endpoint_base
        expect(request[:params]).to be_empty
      end

      expect(Square::ListResponse).to have_received(:new) do |response, data_type|
        expect(response).to eq response
        expect(data_type).to eq subject.data_type
      end
    end

    it 'should call generate_endpoint_url with the correct arguments' do
      allow(Square::APIResource).to receive(:generate_endpoint_url)

      subject.list

      expect(Square::APIResource).to have_received(:generate_endpoint_url) do |*args|
        expect(args).to be_empty
      end
    end
  end
end
