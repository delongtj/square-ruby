require 'spec_helper'

describe Square::Settlement do
  subject { Square::Settlement }
  it_behaves_like 'a listable resource'
  it_behaves_like 'a retrievable resource'
end
