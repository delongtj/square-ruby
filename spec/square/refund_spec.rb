require 'spec_helper'

describe Square::Refund do
  subject { Square::Refund }
  it_behaves_like 'a listable resource'
  it_behaves_like 'a creatable resource'
end
