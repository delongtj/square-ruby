module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatypes
    class BankAccount < Square::DataType
      # The bank account's Square-issued ID.
      property :id

      # The Square-issued ID of the merchant associated with the bank account.
      property :merchant_id

      # The name of the bank that manages the account.
      property :bank_name

      # The name associated with the bank account.
      property :name

      # The bank account's type (for example, savings or checking).
      property :type # BankAccount.Type

      # The bank account's routing number.
      property :routing_number

      # The last few digits of the bank account number.
      property :account_number_suffix

      # The currency code of the currency associated with the bank account,
      # in ISO 4217 format. For example, the currency code for US dollars
      # is USD.
      property :currency_code
    end
  end
end
