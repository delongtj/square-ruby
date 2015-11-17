module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-fee
    class Fee < Square::DataType
      # The fee's unique ID.
      property :id

      # The fee's name.
      property :name

      # The rate of the fee, as a string representation of a decimal number.
      # A value of 0.07 corresponds to a rate of 7%.
      property :rate, coerce: Float

      # Forthcoming.
      property :calculation_phase # Fee.CalculationPhase

      # The type of adjustment the fee applies to a payment. Currently,
      # this value is TAX for all fees.
      property :adjustment_type # Fee.AdjustmentType

      # If true, the fee applies to custom amounts entered into Square
      # Register that are not associated with a particular item.
      property :applies_to_custom_amounts # boolean

      # If true, the fee is applied to all appropriate items. If false,
      # the fee is not applied at all.
      property :enabled # boolean

      # Whether the fee is ADDITIVE or INCLUSIVE.
      property :inclusion_type # Fee.InclusionType

      # In countries with multiple classifications for sales taxes, indicates
      # which classification the fee falls under. Currently relevant only
      # to Canadian merchants.
      property :type # Fee.Type
    end
  end
end
