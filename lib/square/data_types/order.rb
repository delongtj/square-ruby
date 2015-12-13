module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-order
    class Order < Square::DataType
      # The order's unique ID.
      property :id

      # The order's current state, such as OPEN or COMPLETED.
      property :state # Order.State

      # The buyer's email
      property :buyer_email

      # The buyer's name
      property :recipient_name

      # The buyer's phone number
      property :recipient_phone_number

      # The shipping address for the order
      property :shipping_address, coerce: Square::DataTypes::ItemImage

      # The total price of the order before tax and shipping
      property :subtotal_money, coerce: Square::DataTypes::Money

      # The shipping cost of the order
      property :total_shipping_money, coerce: Square::DataTypes::Money

      # The total tax applied to the order
      property :total_tax_money, coerce: Square::DataTypes::Money

      # The total cost of the order
      property :total_price_money, coerce: Square::DataTypes::Money

      # The total of all discounts applied to the order
      property :total_discount_money, coerce: Square::DataTypes::Money

      # The time when the merchant created the order,
      # in ISO 8601 format.
      property :created_at

      # The time when the order was last updated,
      # in ISO 8601 format.
      property :updated_at

      # The time when order expires if no action is taken,
      # in ISO 8601 format.
      property :expires_at

      # The Square-issued ID of the payment associated with the order.
      property :payment_id

      # The optional note provided by the buyer when the order was created.
      property :buyer_note

      # The optional note provided by the merchant when the order's state
      # was set to COMPLETED
      property :completed_note

      # The optional note provided by the merchant when the order's state
      # was set to REFUNDED
      property :refunded_note

      # The optional note provided by the merchant when the order's state
      # was set to CANCELED
      property :canceled_note

      # The tender used to pay for the order.
      property :tender, coerce: Square::DataTypes::Tender

      # The history of actions associated with the order
      property :order_history, coerce: Array[Square::DataTypes::OrderHistoryEntry]

      # The promo code provided by the buyer.
      property :promo_code

      # The address the buyer sent Bitcoins to if the order
      # was a Bitcoin transaction
      property :btc_receive_address

      # The price of the order in satoshi (100 million satoshi == 1 BTC)
      # if the order was a Bitcoin transaction
      property :btc_price_satoshi
    end
  end
end
