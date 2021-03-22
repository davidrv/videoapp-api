require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http redirect without logging in" do
      get "/home/index"
      expect(response).to have_http_status(:redirect)
    end
  end

end
