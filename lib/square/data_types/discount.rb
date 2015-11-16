module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-discount
    class Discount < Square::DataType
      # The discount's unique ID.
      property :id

      # The discount's name.
      property :name

      # The rate of the discount, as a string representation of a decimal
      # number. A value of 0.07 corresponds to a rate of 7%. This rate is
      # 0 if discount_type is VARIABLE_PERCENTAGE.
      # This field is not included for amount-based discounts.
      property :rate

      # The amount of the discount. This amount is 0 if discount_type is
      # VARIABLE_AMOUNT.
      # This field is not included for rate-based discounts.
      property :amount_money, coerce: Square::DataTypes::Money

      # Indicates whether the discount is a FIXED value or entered at the
      # time of sale.
      property :discount_type # Discount.Type

      # Indicates whether a mobile staff member needs to enter their PIN to
      # apply the discount to a payment.
      property :pin_required # boolean

      # The color of the discount's display label in Square Register, if not
      # the default color.
      # The default color is 9da2a6.
      property :color # Item.Color
    end
  end
end
