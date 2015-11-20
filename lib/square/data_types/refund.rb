module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-refund
    class Refund < DataType
      # The type of refund (FULL or PARTIAL).
      property :type # Refund.Type

      # The merchant-specified reason for the refund.
      property :reason

      # The amount of money refunded. This amount is always negative.
      property :refunded_money, coerce: Square::DataTypes::Money

      # The time when the merchant initiated the refund for Square to process,
      # in ISO 8601 format.
      property :created_at

      # The time when Square processed the refund on behalf of the merchant,
      # in ISO 8601 format.
      property :processed_at

      # The Square-issued ID of the payment the refund is applied to.
      property :payment_id

      # undocumented
      property :merchant_id
      property :refunded_processing_fee_money
      property :refunded_additive_tax_money

      # fixes specs
      property :id
    end
  end
end
