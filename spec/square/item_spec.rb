require 'spec_helper'

describe Square::Item do
  subject { Square::Item }
  it_behaves_like 'an api resource'
  it_behaves_like 'a listable resource'
  it_behaves_like 'a creatable resource'
  it_behaves_like 'a deletable resource'
  it_behaves_like 'a retrievable resource'
  it_behaves_like 'an updatable resource'

  describe '.upload_image' do
    let(:item_id) { 'item-id' }
    let(:image_url) { './spec/data/test_image.jpg' }

    it 'should upload an image' do
      host = File.join(Square.api_host, Square.api_version, Square.merchant_id,
        subject.endpoint_base, item_id, 'image')
      stub_request(:post, host)

      Square::Item.upload_image(image_url, item_id)

      req = a_request(:post, host).with do |request|
        request.headers['Authorization'] == "Bearer #{Square.access_token}" &&
        request.headers['Content-Type'] == 'multipart/form-data; boundary=-----------RubyMultipartPost'
      end

      expect(req).to have_been_made.once
    end
  end
end
