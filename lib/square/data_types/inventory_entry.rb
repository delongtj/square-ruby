module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-inventoryentry
    class InventoryEntry < Square::DataType
      # The variation that the entry corresponds to.
      property :variation_id

      # The current available quantity of the item variation.
      property :quantity_on_hand # number
    end
  end
end
