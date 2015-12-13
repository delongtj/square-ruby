module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-orders
  class Order < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve
    extend Square::APIOperations::Update

    endpoint_base 'orders'
    data_type Square::DataTypes::Order
  end
end
