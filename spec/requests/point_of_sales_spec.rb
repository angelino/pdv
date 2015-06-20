require 'rails_helper'

RSpec.describe "PointOfSales", type: :request do
  describe "GET /point_of_sales" do
    it "return a list of all point of sale" do
      get '/point_of_sales', {}, { 'Accept' => Mime::JSON }
      # puts response.to_a[2].inspect
      expect(response).to have_http_status(200)
    end
  end
end
