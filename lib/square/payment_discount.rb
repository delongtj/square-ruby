module Square
  # https://docs.connect.squareup.com/api/connect/v1/#datatype-paymentdiscount
  class PaymentDiscount < DataType
    # The discount's name.
    property :name

    # The amount of money that this discount adds to the payment (note that
    # this value is always negative or zero).
    property :applied_money, coerce: Square::Money

    # The ID of the applied discount, if available. Discounts applied in older
    # versions of Square Register might not have an ID.
    property :discount_id
  end
end
