module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-merchant
  class Merchant < APIResource
    data_type Square::DataTypes::Merchant

    def self.retrieve(merchant_id = 'me')
      Square.get('')
    end
  end
end
