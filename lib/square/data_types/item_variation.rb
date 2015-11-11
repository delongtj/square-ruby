module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-itemvariation
    class ItemVariation < DataType
      # The item variation's unique ID.
      property :id

      # The item variation's name.
      property :name

      # The ID of the variation's associated item.
      property :item_id

      # Indicates the variation's list position when displayed in Square
      # Register and the merchant dashboard. If more than one variation for
      # the same item has the same ordinal value, those variations are
      # displayed in alphabetical order.
      # An item's variation with the lowest ordinal value is displayed first.
      property :ordinal # number

      # Indicates whether the item variation's price is fixed or determined at
      # the time of sale.
      property :pricing_type # ItemVariation.PricingType

      # The item variation's price, if any.
      property :price_money, coerce: Square::DataTypes::Money

      # The item variation's SKU, if any.
      property :sku

      # If true, inventory tracking is active for the variation.
      property :track_inventory # boolean

      # Indicates whether the item variation displays an alert when its
      # inventory quantity is less than or equal to its
      # inventory_alert_threshold.
      property :inventory_alert_type # InventoryAlertType

      # If the inventory quantity for the variation is less than or equal to
      # this value and inventory_alert_type is LOW_QUANTITY, the variation
      # displays an alert in the merchant dashboard.
      # This value is always an integer.
      property :inventory_alert_threshold # number

      # Arbitrary metadata associated with the variation. Cannot exceed 255 characters.
      property :user_data
    end
  end
end
