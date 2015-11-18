module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-fees
  class Fee < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve
    extend Square::APIOperations::Create
    extend Square::APIOperations::Update
    extend Square::APIOperations::Delete

    endpoint_base 'fees'
    data_type Square::DataTypes::Fee

    def self.apply(item_id, fee_id, params = {})
      response = Square.make_request({
        method: 'PUT',
        endpoint: "items/#{item_id}/fees/#{fee_id}",
        params: params
      })

      response = Square.parse_response(response)

      Square::DataTypes::Item.new(response)
    end

    def self.remove(item_id, fee_id, params = {})
      response = Square.make_request({
        method: 'DELETE',
        endpoint: "items/#{item_id}/fees/#{fee_id}",
        params: params
      })
      response = Square.parse_response(response)

      Square::DataTypes::Item.new(response)
    end
  end
end
