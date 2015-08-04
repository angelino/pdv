require 'rails_helper'

RSpec.describe "PointOfSales", type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  # Assumes you have FactoryGirl included in your application's test group.
  let!(:user) { FactoryGirl.create(:user, email: 'exemplo@gmail.com', password: 'lucas_cabecao') }

  describe "GET /point_of_sales" do
    it "return a list of all point of sale" do
      sign_in(user)
      get '/point_of_sales', {}, { 'Accept' => Mime::JSON }
      expect(response).to have_http_status(200)
    end
  end


end
