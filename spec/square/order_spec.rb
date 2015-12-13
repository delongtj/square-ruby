require 'spec_helper'

describe Square::Order do
  subject { Square::Order }
  it_behaves_like 'a listable resource'
  it_behaves_like 'a retrievable resource'
  it_behaves_like 'an updatable resource'
end
