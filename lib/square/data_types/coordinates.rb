module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-coordinates
    class Coordinates < Square::DataType
      # The latitude coordinate, in degrees.
      property :latitude # number

      # The longitude coordinate, in degrees.
      property :longitude # number
    end
  end
end
