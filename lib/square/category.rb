module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-categories
  class Category < APIResource
    endpoint_base 'categories'
    data_type Square::DataTypes::Category
  end
end
