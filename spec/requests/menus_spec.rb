require 'rails_helper'

RSpec.describe "Menus API", type: :request do

  describe "GET /diners/:id/menu" do
    it "return a list of all menu items with images" do
      diner = FactoryGirl.create :point_of_sale, name: 'Bar do Pedraum'
      product = FactoryGirl.create :product, name: 'Coca-Cola 350ml', price: 3.5
      image = FactoryGirl.create :image, owner: product, public_id: 'exemplo'
      storage_entry = FactoryGirl.create :storage_entry, quantity: 20,
                                                         product: product,
                                                         point_of_sale: diner

      get "/diners/#{diner.id}/menu", {}, { 'Accept' => Mime::JSON }

      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)

      expect(body[0]['id']).to eq(diner.id)
      expect(body[0]['name']).to eq(product.name)
      expect(body[0]['price']).to eq(product.price)
      expect(body[0]['images']).to match_array([
        { "thumbnail_url"=>"http://res.cloudinary.com/msitbrasil/image/upload/t_media_lib_thumb/exemplo",
          "url"=>"http://res.cloudinary.com/msitbrasil/image/upload/exemplo" }
      ])
    end

    it "return a list of all menu items no images" do
      diner = FactoryGirl.create :point_of_sale, name: 'Nespresso Coffee'
      product = FactoryGirl.create :product, name: 'Coffee', price: 4
      storage_entry = FactoryGirl.create :storage_entry, quantity: 100,
                                                         product: product,
                                                         point_of_sale: diner

      get "/diners/#{diner.id}/menu", {}, { 'Accept' => Mime::JSON }

      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)

      expect(body[0]['id']).to eq(diner.id)
      expect(body[0]['name']).to eq(product.name)
      expect(body[0]['price']).to eq(product.price)
      expect(body[0]['images']).to match_array([])
    end
  end

end
