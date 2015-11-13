module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-globaladdress
    class GlobalAddress < Square::DataType
      # The first line of the address.
      # Fields that start with address_line provide the address's most
      # specific details, like street number, street name, and building name.
      # They do not provide less specific details like city, state/province,
      # or country (these details are provided in other fields).
      property :address_line_1

      # The second line of the address, if any.
      property :address_line_2

      # The third line of the address, if any.
      property :address_line_3

      # The fourth line of the address, if any.
      property :address_line_4

      # The fifth line of the address, if any.
      property :address_line_5

      # The city or town of the address.
      property :locality

      # A civil region within the address's locality, if any.
      property :sublocality

      # A civil region within the address's sublocality, if any.
      property :sublocality_1

      # A civil region within the address's sublocality_1, if any.
      property :sublocality_2

      # A civil region within the address's sublocality_2, if any.
      property :sublocality_3

      # A civil region within the address's sublocality_3, if any.
      property :sublocality_4

      # A civil region within the address's sublocality_4, if any.
      property :sublocality_5

      # A civil entity within the address's country. In the United States,
      # this is the state.
      property :administrative_district_level_1

      # A civil entity within the address's administrative_district_level_1,
      # if any. In the United States, this is the county.
      property :administrative_district_level_2

      # A civil entity within the address's administrative_district_level_2,
      # if any.
      property :administrative_district_level_3

      # The address's postal code.
      property :postal_code

      # The address's country, in ISO 3166-1-alpha-2 format.
      property :country_code

      # The coordinates of the address.
      property :address_coordinates, coerce: Square::DataTypes::Coordinates	
    end
  end
end
