module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-modifierlist
    class ModifierList < Square::DataType
      # The modifier list's unique ID.
      property :id

      # The modifier list's name.
      property :name

      # Indicates whether MULTIPLE options or a SINGLE option from the
      # modifier list can be applied to a single item.
      property :selection_type # ModifierList.SelectionType

      # The options included in the modifier list.
      property :modifier_options#, coerce: Array[Square::DataTypes::ModifierOption]
    end
  end
end
