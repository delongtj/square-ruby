module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-refunds
  class Refund < APIResource
    endpoint_base 'refunds'
    data_type Square::DataTypes::Refund
  end
end
