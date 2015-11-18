module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-bankaccounts
  class BankAccount < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve

    endpoint_base 'bank-accounts'
    data_type Square::DataTypes::BankAccount
  end
end
