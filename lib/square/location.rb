module Square
  # https://docs.connect.squareup.com/api/connect/v1/index.html#get-locations
  class Location < APIResource
    extend Square::APIOperations::List

    endpoint_base 'locations'
    data_type Square::DataTypes::Merchant
  end
end
