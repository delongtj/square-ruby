module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-itemimage
    class ItemImage < Square::DataType
      # The image's unique ID.
      property :id

      # The image's publicly accessible URL.
      property :url
    end
  end
end
