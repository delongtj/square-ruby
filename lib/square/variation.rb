module Square
  # Square Connect Variations.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-variations
  class Variation < Hashie::Mash
    # Create a variation.
    #
    # @param [String] ID of the item in which to create a variation.
    # @param [Hash] Variation data.
    #
    # @return [Square::Variation]
    def self.create(item_id, data)
      response = Square.make_request(
        method: 'POST',
        endpoint: "items/#{item_id}/variations",
        payload: data
      )

      response = JSON.parse(response)
      Variation.new(response)
    end

    # Update a variation.
    #
    # @param item_id [String] ID of a Square::Item.
    # @param id [String] ID of a Square::Variation.
    # @param data [Hash] Update data.
    #
    # @return [Square::Variation]
    def self.update(item_id, id, data)
      response = Square.make_request(
        method: 'PUT',
        endpoint: "items/#{item_id}/variations/#{id}",
        payload: data
      )

      response = JSON.parse(response)
      Variation.new(response)
    end

    # Delete a variation.
    #
    # @param id [String] Variation ID.
    # @param item_id [String] Item ID.
    #
    # @return [RestClient::Response] API response.
    def self.delete(id, item_id)
      ap 'You probably dont want to do this. See Square::Item.delete.'
      Square.make_request(endpoint: "items/#{item_id}/variations/#{id}")
    end
  end
end
