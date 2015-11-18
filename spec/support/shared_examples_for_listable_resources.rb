shared_examples 'a listable resource' do
  describe '.list' do
    it 'shoud work' do
      expect(subject).to respond_to :list
    end
  end
end
