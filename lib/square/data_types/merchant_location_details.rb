module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-merchantlocationdetails
    class MerchantLocationDetails < Square::DataType
      # The nickname assigned to the single-location account by the parent
      # business. This value appears in the parent business's multi-location
      # dashboard.
      property :nickname
    end
  end
end
