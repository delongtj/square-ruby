module Square
  # Square Connect Fees.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-fees
  class Fee < APIResource
    endpoint_base 'fees'
    data_type Square::DataTypes::Fee

    def self.apply(item_id, fee_id)
      request = {
        method: 'PUT',
        endpoint: "items/#{item_id}/fees/#{fee_id}"
      }

      response = Square.make_request(request)
      response = JSON.parse(response)

      Square::DataTypes::Item.new(response)
    end
  end
end
