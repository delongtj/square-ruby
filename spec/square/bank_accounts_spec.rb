require 'spec_helper'

describe Square::BankAccount do
  subject { Square::BankAccount }
  it_behaves_like 'a listable resource'
  it_behaves_like 'a retrievable resource'
end
