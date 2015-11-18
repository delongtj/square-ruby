shared_examples 'an api resource' do
  it 'should be an api resource' do
    expect(subject.ancestors).to include Square::APIResource
  end
end
