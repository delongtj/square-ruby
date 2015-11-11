module Square
  # https://docs.connect.squareup.com/api/connect/v1/#datatype-paymentmodifier
  class PaymentModifier < DataType
    # The modifier option's name.
    property :name

    # The amount of money that this modifier option adds to the payment.
    property :applied_money, coerce: Square::Money

    # The ID of the applied modifier option, if available. Modifier options
    # applied in older versions of Square Register might not have an ID.
    property :modifier_option_id
  end
end
