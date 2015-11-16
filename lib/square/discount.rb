module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-discounts
  class Discount < APIResource
    endpoint_base 'discounts'
    data_type Square::DataTypes::Discount
  end
end
