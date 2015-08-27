require 'rails_helper'

RSpec.describe "Sales", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  # Assumes you have FactoryGirl included in your application's test group.
  let!(:user) { FactoryGirl.create(:user, email: 'exemplo@gmail.com', password: 'lucas_cabecao') }

  before do
    @pos = FactoryGirl.create :point_of_sale, name: 'Bar do Alemão'
    @product = FactoryGirl.create :product, name: 'Kibe', price: 3.0
    @storage_entry = FactoryGirl.create :storage_entry, quantity: 20,
                                                        product: @product,
                                                        point_of_sale: @pos
    FactoryGirl.create :sell_storage_entry_type
  end

  describe "POST /sales" do
    it "works!" do
      headers = {
          'Accept' => Mime::JSON
      }

      body = {
        "items" => [
          {
            "product_id" => "#{@product.id}",
            "quantity" => "1"
          },
        ],
        "commercial_conditions" => [
        ]
      }

      sign_in(user)
      post "/point_of_sales/#{@pos.id}/sales", body, headers

      expect(response).to have_http_status(:created)
    end
  end
end