module Square
  # https://docs.connect.squareup.com/api/connect/v1/#navsection-itemmanagement
  class Item < APIResource
    extend Square::APIOperations::List
    extend Square::APIOperations::Retrieve
    extend Square::APIOperations::Create
    extend Square::APIOperations::Update
    extend Square::APIOperations::Delete

    endpoint_base 'items'
    data_type Square::DataTypes::Item

    # Upload an image for an item.
    # https://docs.connect.squareup.com/api/connect/v1/#post-image
    #
    # @param image_url [String] Image URL.
    # @param item_id [String] Square item id.
    #
    # @return [Net::HTTPResponse] API response.
    def self.upload_image(image_url, item_id)
      image = open(image_url)
      filename = File.basename(image_url)

      uri = URI.parse("#{Square.api_host}/v1/me/#{instance_variable_get('@endpoint_base')}/#{item_id}/image")
      connection = Net::HTTP.new(uri.host, uri.port)
      connection.use_ssl = (uri.scheme == 'https')

      # Making this request here because RestClient doesn't do multipart
      # requests the way Square wants it.
      request = Net::HTTP::Post::Multipart.new(
        uri.path,
        image_data: UploadIO.new(image, 'image/jpeg', filename)
      )

      # Copy the auth header.
      request['Authorization'] = Square.request_headers(Square.access_token)[:authorization]
      connection.request(request)
    end
  end
end
