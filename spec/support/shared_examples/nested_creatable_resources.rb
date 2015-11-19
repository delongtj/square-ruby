shared_examples 'a nested creatable resource' do
  describe '.create' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'shoud be defined' do
      expect(subject).to respond_to :create
    end

    it 'should raise an error when called with incorrect arguments' do
      expect { subject.create }.to raise_error ArgumentError
      expect { subject.create('test-id') }.to raise_error ArgumentError
      expect { subject.create('test-id', 'parent-id') }.to raise_error NoMethodError
    end

    it 'should create a resource' do
      params = {test_key: 'test_value'}
      parent_id = 'parent_id'

      subject.create(parent_id, params)

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'POST'
        expect(request[:endpoint]).to eq File.join(subject.nested_under, parent_id, subject.endpoint_base)
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
