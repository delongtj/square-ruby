module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-phonenumber
    class PhoneNumber < Square::DataType
      # The phone number's international calling code. For US phone numbers,
      # this value is +1.
      property :calling_code

      # The phone number.
      property :number
    end
  end
end
