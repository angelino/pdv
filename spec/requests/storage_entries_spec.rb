require 'rails_helper'

RSpec.describe "StorageEntries", type: :request do
  describe "GET /storage_entries" do
    it "works! (now write some real specs)" do
      get storage_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
