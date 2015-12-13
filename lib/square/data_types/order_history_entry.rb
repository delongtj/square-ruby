module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-orderhistoryentry
    class OrderHistoryEntry < Square::DataType
      # The type of action performed on the order
      property :action

      # The time when the action was performed on the order,
      # in ISO 8601 format.
      property :created_at
    end
  end
end
