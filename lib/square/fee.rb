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

    # Adjust inventory for a varation.
    #
    # @param item_id [String] Item ID.
    # @param fee_id [String] Fee ID.
    #
    # @return [Square::DataType]
    def self.apply(item_id, fee_id)
      response = Square.make_request(
        method: 'PUT',
        endpoint: File.join('items', item_id, @endpoint_base, fee_id)
      )

      response = Square.parse_response(response)
      Square::DataTypes::Item.new(response)
    end

    # Adjust inventory for a varation.
    #
    # @param item_id [String] Item ID.
    # @param fee_id [String] Fee ID.
    # @param params [Hash] Params hash. Optional.
    #
    # @return [Square::DataType]
    def self.remove(item_id, fee_id)
      response = Square.make_request(
        method: 'DELETE',
        endpoint: File.join('items', item_id, @endpoint_base, fee_id)
      )

      response = Square.parse_response(response)
      Square::DataTypes::Item.new(response)
    end
  end
end
