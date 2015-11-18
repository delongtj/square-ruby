module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-settlements
  class Settlement < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve

    endpoint_base 'settlements'
    data_type Square::DataTypes::Settlement
  end
end
