module Square
  class Settlement < APIResource
    endpoint_base 'settlements'
    data_type Square::DataTypes::Settlement
  end
end
