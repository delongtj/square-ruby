module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-inventory
  class Inventory < APIResource
    extend Square::APIOperations::List

    endpoint_base 'inventory'
    data_type Square::DataTypes::InventoryEntry

    # Adjust inventory for a varation.
    #
    # @param variation_id [String] Variation ID. Required.
    # @param params [Hash] Params hash. Optional.
    #
    # @return [Square::DataType]
    def self.adjust(variation_id, params = {})
      response = Square.make_request(
        method: 'POST',
        endpoint: self.generate_endpoint_url(variation_id),
        payload: params
      )

      response = Square.parse_response(response)
      @data_type.new(response)
    end
  end
end
