module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-settlement
    class Settlement < Square::DataType
      # The settlement's unique identifier.
      property :id

      # The settlement's current status.
      property :status # Settlement.Status

      # The time when the settlement was submitted for deposit or withdrawal,
      # in ISO 8601 format.
      property :initiated_at

      # The Square-issued unique identifier for the bank account associated
      # with the settlement.
      property :bank_account_id

      # The amount of money involved in the settlement. A positive amount
      # indicates a deposit, and a negative amount indicates a withdrawal.
      # This amount is never zero.
      property :total_money, coerce: Square::DataTypes::Money

      # The entries included in this settlement.
      property :entries, coerce: Array[Square::DataTypes::SettlementEntry]
    end
  end
end
