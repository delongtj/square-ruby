module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-discounts
  class Discount < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Create
    extend Square::APIOperations::Update
    extend Square::APIOperations::Delete

    endpoint_base 'discounts'
    data_type Square::DataTypes::Discount
  end
end
