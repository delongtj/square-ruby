module Square
  # Square Connect Variations.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-variations
  class Variation < APIResource
    endpoint_base 'variations'
    nested_under 'items'
    data_type Square::DataTypes::ItemVariation
  end
end
