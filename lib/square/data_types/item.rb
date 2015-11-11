module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-item
    class Item < Square::DataType
      # The item's unique ID.
      property :id

      # The item's name.
      property :name

      # The item's description, if any.
      property :description

      # The item's type. This value is NORMAL for almost all items.
      property :type # Item.Type

      # The text of the item's display label in Square Register. This value
      # is present only if an abbreviation other than the default has been set.
      property :abbreviation

      # The color of the item's display label in Square Register, if not the
      # default color.
      # The default color is 9da2a6.
      property :color # Item.Color

      # Indicates whether the item is viewable in the merchant's online
      # store (PUBLIC) or PRIVATE.
      property :visibility # Item.Visibility

      # If true, the item is available for purchase from the merchant's
      # online store.
      property :available_online # boolean

      # The item's master image, if any.
      property :master_image, coerce: Square::DataTypes::ItemImage

      # The category the item belongs to, if any.
      property :category, coerce: Square::DataTypes::Category

      # The item's variations.
      property :variations, coerce: Array[Square::DataTypes::ItemVariation]

      # The modifier lists that apply to the item, if any.
      property :modifier_lists, coerce: Array[Square::DataTypes::ModifierList]

      # The fees that apply to the item, if any.
      property :fees, coerce: Array[Square::DataTypes::Fee]

      # Deprecated. This field is not used.
      property :taxable, required: false # boolean

      # undocumented
      property :available_for_pickup
      property :images

      # Get this item's variation. There should only ever be one.
      #
      # @return [Square::DataTypes::ItemVariation] First variation.
      def variation
        self.variations.first
      end
    end
  end
end
