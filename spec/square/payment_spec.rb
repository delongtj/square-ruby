require 'spec_helper'

describe Square::Payment do
  subject { Square::Payment }
  it_behaves_like 'a listable resource'
  it_behaves_like 'a retrievable resource'
end
