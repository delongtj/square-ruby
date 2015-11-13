module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-merchant
    class Merchant < Square::DataType
      # The merchant account's unique identifier.
      property :id

      # The name associated with the merchant account.
      property :name

      # The email address associated with the merchant account.
      property :email

      # Indicates whether the merchant account corresponds to a single-location
      # account (LOCATION) or a business account (BUSINESS). This value is
      # almost always LOCATION. See Multi-Location Overview for more
      # information.
      property :account_type # Merchant.AccountType

      # Capabilities that are enabled for the merchant's Square account.
      # Capabilities that are not listed in this array are not enabled for
      # the account. Currently there is only one capability,
      # CREDIT_CARD_PROCESSING.
      property :account_capabilities, coerce: Array[String] # Merchant.AccountCapability[]

      # The country associated with the merchant account, in
      # ISO 3166-1-alpha-2 format.
      property :country_code

      # The language associated with the merchant account, in BCP 47 format.
      property :language_code

      # The currency associated with the merchant account, in ISO 4217 format.
      # For example, the currency code for US dollars is USD.
      property :currency_code

      # The name of the merchant's business.
      property :business_name

      # The address of the merchant's business.
      property :business_address, coerce: Square::DataTypes::GlobalAddress

      # The phone number of the merchant's business.
      property :business_phone, coerce: Square::DataTypes::PhoneNumber

      # The type of business operated by the merchant.
      property :business_type # Merchant.BusinessType

      # The merchant's shipping address.
      property :shipping_address, coerce: Square::DataTypes::GlobalAddress

      # Additional information for a single-location account specified by its
      # associated business account, if it has one.
      # Never included in Merchant objects with the account_typeBUSINESS.
      property :location_details, coerce: Square::DataTypes::MerchantLocationDetails

      # The URL of the merchant's online store.
      property :market_url
    end
  end
end
