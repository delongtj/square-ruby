shared_examples 'a retrievable resource' do
  describe '.retrieve' do
    it 'shoud work' do
      expect(subject).to respond_to :retrieve
    end
  end
end
