require 'rails_helper'

RSpec.describe "Items", type: :request do

  describe "GET /posts" do
    it "returns http success" do
      get "/items/posts"
      expect(response).to have_http_status(:success)
    end
  end

end
