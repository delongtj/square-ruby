module Square
  # https://docs.connect.squareup.com/api/connect/v1/#datatype-money
  class Money < DataType
    # The amount of money, in the smallest unit of the applicable currency.
    # For US dollars, this value is in cents.
    property :amount

    # The type of currency involved in the current payment, in ISO 4217 format.
    # For example, the currency code for US dollars is USD.
    property :currency_code
  end
end
