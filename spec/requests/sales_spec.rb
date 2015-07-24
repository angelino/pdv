require 'rails_helper'

RSpec.describe "Sales", type: :request do
  before do
    @pos = FactoryGirl.create :point_of_sale, name: 'Bar do Alemão'
    @product = FactoryGirl.create :product, name: 'Kibe', price: 3.0
    @storage_entry = FactoryGirl.create :storage_entry, quantity: 20,
                                                         product: @product,
                                                         point_of_sale: @pos
  end

  describe "POST /sales" do
    it "works!" do
      headers = {

      }

      body = {
        "items" => [
          {
            "product_id" => "#{@product.id}",
            "quantidade" => "1"
          },
        ],
        "commercial_conditions" => [
        ]
      }.to_json

      post "/point_of_sales/#{@pos.id}/sales", body, headers

      # puts response.to_a
      # puts response.body

      expect(response).to have_http_status(200)
    end
  end
end
