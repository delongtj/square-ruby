module Square
  # https://docs.connect.squareup.com/api/connect/v1/#datatype-paymentitemdetail
  class PaymentItemDetail < DataType
    # The name of the item's merchant-defined category, if any.
    property :category_name

    # The item's merchant-defined SKU, if any.
    property :sku

    # The unique ID of the item purchased, if any.
    property :item_id

    # The unique ID of the item variation purchased, if any.
    property :item_variation_id
  end
end
