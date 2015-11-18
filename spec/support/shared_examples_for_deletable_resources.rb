shared_examples 'a deletable resource' do
  describe '.delete' do
    it 'shoud work' do
      expect(subject).to respond_to :delete
    end
  end
end
