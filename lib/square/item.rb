require 'open-uri'
require 'net/http/post/multipart'

module Square
  # Square Connect Items.
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-itemmanagement
  class Item < APIResource
    endpoint_base 'items'
    data_type Square::DataTypes::Item

    # ENDPOINT_BASE = 'items'
    #
    # # Create an item.
    # # https://docs.connect.squareup.com/api/connect/v1/#post-items
    # #
    # # @param params [Hash] Square Item. See:
    # # https://docs.connect.squareup.com/api/connect/v1/#datatype-item
    # #
    # # @return [Square::Item] API response.
    # def self.create(params)
    #   response = Square.make_request(
    #     method: 'POST',
    #     endpoint: ENDPOINT_BASE,
    #     payload: params
    #   )
    #
    #   item = JSON.parse(response)
    #   Item.new(item)
    # end
    #
    # # List items.
    # # https://docs.connect.squareup.com/api/connect/v1/#get-items
    # #
    # # @return [Array<Square::Item>] API response.
    # def self.list
    #   response = Square.make_request(endpoint: ENDPOINT_BASE)
    #   response = JSON.parse(response)
    #   response.map {|item| Item.new(item)}
    # end
    #
    # # Get an item.
    # # https://docs.connect.squareup.com/api/connect/v1/#get-itemid
    # #
    # # @return [RestClient::Response] API response.
    # def self.retrieve(id)
    #   response = Square.make_request(endpoint: "#{ENDPOINT_BASE}/#{id}")
    #   item = JSON.parse(response)
    #   Item.new(item)
    # end
    #
    # def self.update
    # end
    #
    # # Delete an item.
    # # https://docs.connect.squareup.com/api/connect/v1/#delete-itemid
    # #
    # # @param id [String] Square item id.
    # #
    # # @return [RestClient::Response] API response.
    # def self.delete(id)
    #   Square.make_request(
    #     method: 'DELETE',
    #     endpoint: "#{ENDPOINT_BASE}/#{id}"
    #   )
    # end
    #
    # # Upload an image for an item.
    # # https://docs.connect.squareup.com/api/connect/v1/#post-image
    # #
    # # @param image_url [String] Image URL.
    # # @param item_id [String] Square item id.
    # #
    # # @return [Net::HTTPResponse] API response.
    # def self.upload_image(image_url, item_id)
    #   # Get the default image off disk.
    #   if image_url.include?('soon.jpg')
    #     image_url = File.join(Rails.root, 'public', '/images/soon.jpg')
    #   end
    #
    #   image = open(image_url)
    #   filename = File.basename(image_url)
    #
    #   uri = URI.parse("#{Square.api_host}/v1/me/#{ENDPOINT_BASE}/#{item_id}/image")
    #   connection = Net::HTTP.new(uri.host, uri.port)
    #   connection.use_ssl = (uri.scheme == 'https')
    #
    #   # Making this request here because RestClient doesn't do multipart requests
    #   # that Square wants it.
    #   request = Net::HTTP::Post::Multipart.new(
    #     uri.path,
    #     image_data: UploadIO.new(image, 'image/jpeg', filename)
    #   )
    #
    #   # Copy the auth header.
    #   request['Authorization'] = Square.request_headers(Square.access_token)[:authorization]
    #   connection.request(request)
    # end
    #
    # # Delete this item.
    # def delete
    #   Item.delete(self.id)
    # end
    #
    # # Get this item's variation. There should only ever be one.
    # #
    # # @return [Hash] First variation.
    # def variation
    #   self.variations.first
    # end
  end
end
