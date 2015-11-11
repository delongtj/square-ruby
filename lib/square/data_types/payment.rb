module Square
  module DataTypes
    class Payment < Square::DataType
      # The payment's unique identifier.
      property :id

      # The unique identifier of the merchant that took the payment.
      property :merchant_id

      # The time when the payment was created, in ISO 8601 format.
      property :created_at

      # The unique identifier of the Square account that took the payment.
      # This value can differ from merchant_id if the merchant has mobile staff.
      property :creator_id

      # The device that took the payment.
      property :device, coerce: Square::Device

      # The URL of the payment's detail page in the merchant dashboard.
      # The merchant must be signed in to the merchant dashboard to view
      # this page.
      property :payment_url

      # The URL of the receipt for the payment.
      # Note that for split tender payments, this URL corresponds to the receipt
      # for the first tender listed in the payment's tender field. Each
      # Tender object has its own receipt_url field you can use to get the
      # other receipts associated with a split tender payment.
      property :receipt_url

      # The sum of all inclusive taxes associated with the payment.
      property :inclusive_tax_money, coerce: Square::Money

      # The sum of all additive taxes associated with the payment.
      property :additive_tax_money, coerce: Square::Money

      # The total of all taxes applied to the payment.
      # This is always the sum of inclusive_tax_money and additive_tax_money.
      property :tax_money, coerce: Square::Money

      # The total of all tips applied to the payment.
      property :tip_money, coerce: Square::Money

      # The total of all discounts applied to the payment.
      # This value is always 0 or negative.
      property :discount_money, coerce: Square::Money

      # The total amount of money collected from the buyer for the payment.
      property :total_collected_money, coerce: Square::Money

      # The total of all processing fees collected by Square for the payment.
      # This value is always 0 or negative.
      property :processing_fee_money, coerce: Square::Money

      # The amount to be deposited into the merchant's bank account for
      # the payment.
      # This is always the sum of total_collected_money and processing_fee_money
      # (note that processing_fee_money is always negative or 0).
      property :net_total_money, coerce: Square::Money

      # The total of all refunds applied to the payment.
      property :refunded_money, coerce: Square::Money

      # All of the inclusive taxes associated with the payment.
      property :inclusive_tax, coerce: Array[Square::PaymentTax]

      # All of the additive taxes associated with the payment.
      property :additive_tax, coerce: Array[Square::PaymentTax]

      # The form(s) of tender provided by the buyer for the payment.
      property :tender, coerce: Array[Square::Tender]

      # All of the refunds applied to the payment.
      property :refunds, coerce: Array[Square::Refund]

      # The items purchased in the payment.
      property :itemizations, coerce: Array[Square::PaymentItemization]

      # undocumented
      property :gross_sales_money
      property :swedish_rounding_money
      property :net_sales_money
    end
  end
end
