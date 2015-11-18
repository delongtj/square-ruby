module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-variations
  class Variation < APIResource
    extend Square::APIOperations::Create
    extend Square::APIOperations::Update
    extend Square::APIOperations::Delete

    endpoint_base 'variations'
    nested_under 'items'
    data_type Square::DataTypes::ItemVariation
  end
end
