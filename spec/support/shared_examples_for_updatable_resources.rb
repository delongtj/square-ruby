shared_examples 'an updatable resource' do
  describe '.update' do
    it 'shoud work' do
      expect(subject).to respond_to :update
    end
  end
end
