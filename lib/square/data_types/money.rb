module Square
  module DataTypes
    # https://docs.connect.squareup.com/api/connect/v1/#datatype-money
    class Money < Square::DataType
      # The amount of money, in the smallest unit of the applicable currency.
      # For US dollars, this value is in cents.
      property :amount

      # The type of currency involved in the current payment, in ISO 4217 format.
      # For example, the currency code for US dollars is USD.
      property :currency_code

      # Initialize.
      #
      # @param [Hash] Hash of amount and currency_code.
      #
      # You can also pass in the amount and currency code as separate arguments.
      #
      # Example
      #
      #  a = Square::DataTypes::Money.new(1)
      #  b = Square::DataTypes::Money.new({amount: 1, currency_code: 'USD'})
      #  a == b
      #  #=> true
      #
      # @return [Square::DataTypes::Money]
      def initialize(*args)
        # Should this really even have a default?
        code = args[1] || 'USD'

        if args.count == 1 && args.first.is_a?(Hash)
          data = args.first
        else
          data = {amount: args[0], currency_code: code}
        end

        super(data)
      end
    end
  end
end
