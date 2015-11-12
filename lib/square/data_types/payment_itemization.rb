module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-paymentitemization
    class PaymentItemization < DataType
      # The item's name.
      property :name

      # The quantity of the item purchased. This can be a decimal value.
      property :quantity, coerce: Integer

      # The type of purchase that the itemization represents,
      # such as an ITEM or CUSTOM_AMOUNT.
      property :itemization_type # PaymentItemization.Type

      # Details of the item, including its unique identifier and the identifier
      # of the item variation purchased.
      property :item_detail, coerce: Square::DataTypes::PaymentItemDetail

      # Notes entered by the merchant about the item at the time of payment,
      # if any.
      property :notes

      # The name of the item variation purchased, if any.
      property :item_variation_name

      # The total cost of the item, including all taxes and discounts.
      property :total_money, coerce: Square::DataTypes::Money

      # The cost of a single unit of this item.
      property :single_quantity_money, coerce: Square::DataTypes::Money

      # The total cost of the itemization and its modifiers, not including
      # taxes or discounts.
      property :gross_sales_money, coerce: Square::DataTypes::Money

      # The total of all discounts applied to the itemization. This value is
      # always negative or zero.
      property :discount_money, coerce: Square::DataTypes::Money

      # The sum of gross_sales_money and discount_money.
      property :net_sales_money, coerce: Square::DataTypes::Money

      # All taxes applied to this itemization.
      property :taxes, coerce: Array[Square::DataTypes::PaymentTax]

      # All discounts applied to this itemization.
      property :discounts, coerce: Array[Square::DataTypes::PaymentDiscount]

      # All modifier options applied to this itemization.
      property :modifiers, coerce: Array[Square::DataTypes::PaymentModifier]
    end
  end
end
