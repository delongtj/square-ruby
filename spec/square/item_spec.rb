require 'spec_helper'

describe Square::Item do
  subject { Square::Item }
  it_behaves_like 'an api resource'
  it_behaves_like 'a listable resource'
  it_behaves_like 'a creatable resource'
  it_behaves_like 'a deletable resource'
  it_behaves_like 'a retrievable resource'
  it_behaves_like 'an updatable resource'
end
