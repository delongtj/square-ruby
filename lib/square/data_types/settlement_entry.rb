module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-settlemententry
    class SettlementEntry < Square::DataType
      # The type of activity this entry represents.
      property :type # SettlementEntry.Type

      # The payment associated with the settlement entry, if any.
      property :payment_id

      # The total amount of money this entry contributes to the total
      # settlement amount.
      property :amount_money, coerce: Square::DataTypes::Money

      # The amount of all Square fees associated with this settlement entry.
      # This value is always negative or zero.
      # This amount has already been applied to amount_money.
      property :fee_money, coerce: Square::DataTypes::Money
    end
  end
end
