require 'spec_helper'

describe Square::DataType do
  it 'should be a Hashie::Dash' do
    data = Square::DataType.new

    expect(data).to be_a Hashie::Dash
    expect(Square::DataType.included_modules).to include(
      Hashie::Extensions::Dash::Coercion,
      Hashie::Extensions::IndifferentAccess,
      Hashie::Extensions::IgnoreUndeclared
    )
  end
end
