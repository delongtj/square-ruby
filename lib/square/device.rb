module Square
  # https://docs.connect.squareup.com/api/connect/v1/#datatype-device
  class Device < DataType
    # The device's merchant-specified name.
    property :name

    # The device's Square-issued ID.
    property :id
  end
end
