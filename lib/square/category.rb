module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-categories
  class Category < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Create
    extend Square::APIOperations::Update
    extend Square::APIOperations::Delete

    endpoint_base 'categories'
    data_type Square::DataTypes::Category
  end
end
