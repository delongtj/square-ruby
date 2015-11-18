module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-payments
  class Payment < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve

    endpoint_base 'payments'
    data_type Square::DataTypes::Payment
  end
end
