require 'spec_helper'

describe Square::Variation do
  subject { Square::Variation }
  it_behaves_like 'an api resource'
  it_behaves_like 'a nested creatable resource'
  # it_behaves_like 'a deletable resource'
  # it_behaves_like 'an updatable resource'
end
