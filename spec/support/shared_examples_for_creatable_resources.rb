shared_examples 'a creatable resource' do
  describe '.create' do
    it 'shoud work' do
      expect(subject).to respond_to :create
    end
  end
end
