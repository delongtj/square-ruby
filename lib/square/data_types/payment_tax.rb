module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-paymenttax
    class PaymentTax < DataType
      # The merchant-defined name of the tax.
      property :name

      # The amount of money that this tax adds to the payment.
      property :applied_money, coerce: Square::DataTypes::Money

      # The rate of the tax, as a string representation of a decimal number.
      # A value of 0.07 corresponds to a rate of 7%.
      property :rate

      # Whether the tax is an ADDITIVE tax or an INCLUSIVE tax.
      property :inclusion_type, required: true, coerce: -> (value) { self.thing(value) }

      # The ID of the tax, if available. Taxes applied in older versions of
      # Square Register might not have an ID.
      property :fee_id

      def self.thing(value)
        ['ADDITIVE', 'INCLUSIVE'].include?(value) ? value : nil
      end
    end
  end
end
