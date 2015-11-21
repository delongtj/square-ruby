require 'spec_helper'

describe Square::DataTypes::Money do
  subject { Square::DataTypes::Money }
  it 'should be a Square::DataType' do
    expect(Square::DataTypes::Money.ancestors).to include Square::DataType
  end

  describe '#initialize' do
    it 'should set the amount and currency code attributes' do
      money1 = subject.new(1)
      expect(money1).to have_attributes amount: 1, currency_code: 'USD'

      money2 = subject.new(2, 'something')
      expect(money2).to have_attributes amount: 2, currency_code: 'something'

      money3 = subject.new(3, 'something', 'whatever')
      expect(money3).to have_attributes amount: 3, currency_code: 'something'
    end

    it 'should allow a hash argument' do
      money1 = subject.new(amount: 1)
      expect(money1).to have_attributes amount: 1

      money2 = subject.new(amount: 2, currency_code: 'something')
      expect(money2).to have_attributes amount: 2, currency_code: 'something'

      money3 = subject.new(amount: 3, currency_code: 'something', what: 'ever')
      expect(money3).to have_attributes amount: 3, currency_code: 'something'
    end
  end
end
