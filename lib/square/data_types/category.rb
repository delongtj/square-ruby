module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-category
    class Category < Square::DataType
      # The category's unique ID.
      property :id

      # The category's name.
      property :name
    end
  end
end
