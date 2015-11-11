module Square
  # Square Connect Payments.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-payments
  class Payment < DataType

    property :device, coerce: Square::Device

    property :id
    property :merchant_id
    property :created_at
    property :creator_id
    # property :device, coerce:  Device
    property :payment_url
    property :receipt_url
    property :inclusive_tax_money,   coerce: Square::Money
    property :additive_tax_money,    coerce: Square::Money
    property :tax_money,             coerce: Square::Money
    property :tip_money,             coerce: Square::Money
    property :discount_money,        coerce: Square::Money
    property :total_collected_money, coerce: Square::Money
    property :processing_fee_money,  coerce: Square::Money
    property :net_total_money,       coerce: Square::Money
    property :refunded_money,        coerce: Square::Money
    # property :inclusive_tax, coerce:  PaymentTax[]
    # property :additive_tax, coerce:  PaymentTax[]
    # property :tender, coerce:  Tender[]
    # property :refunds, coerce:  Refund[]
    property :itemizations,          coerce: Array[Square::PaymentItemization]
  end
end
