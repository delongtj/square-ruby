module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-modifieroption
    class ModifierOption < Square::DataType
      # The modifier option's unique ID.
      property :id

      # The modifier option's name.
      property :name

      # The modifier option's price.
      property :price_money, coerce: Square::DataTypes::Money

      # If true, the modifier option is the default option in a modifier
      # list for which selection_type is SINGLE.
      property :on_by_default # boolean

      # Indicates the modifier option's list position when displayed in
      # Square Register and the merchant dashboard. If more than one
      # modifier option in the same modifier list has the same ordinal
      # value, those options are displayed in alphabetical order.
      # A modifier list's option with the lowest ordinal value is
      # displayed first.
      property :ordinal # number

      # The ID of the modifier list the option belongs to.
      property :modifier_list_id
    end
  end
end
