require 'spec_helper'

describe Square::Webhook do
  subject { Square::Webhook }
  it_behaves_like 'a listable resource'
  it_behaves_like 'an updatable resource'
end
