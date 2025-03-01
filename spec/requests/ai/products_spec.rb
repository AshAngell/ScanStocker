require 'rails_helper'

RSpec.describe "Ai::Products", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/ai/products/create"
      expect(response).to have_http_status(:success)
    end
  end

end
