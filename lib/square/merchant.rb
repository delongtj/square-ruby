module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-merchant
  class Merchant < APIResource
    extend Square::APIOperations::Retrieve

    data_type Square::DataTypes::Merchant

    def self.retrieve(merchant_id = nil)
      response = Square.make_request(
        merchant: merchant_id
      )

      response = Square.parse_response(response)
      @data_type.new(response)
    end
  end
end
