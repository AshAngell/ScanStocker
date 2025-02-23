require 'rails_helper'

RSpec.describe "Qrs", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/qr/show"
      expect(response).to have_http_status(:success)
    end
  end

end
