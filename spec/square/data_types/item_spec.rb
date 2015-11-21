require 'spec_helper'

describe Square::DataTypes::Item do
  subject { Square::DataTypes::Item }
  let(:item) { subject.new }

  describe '#variation' do
    it 'should be defined' do
      expect(item).to respond_to(:variation)
    end

    it 'should return a variation' do
      variation = Square::DataTypes::ItemVariation.new
      variation2 = Square::DataTypes::ItemVariation.new
      item.variations = [variation, variation2]
      expect(item.variation).to be variation
    end
  end
end
