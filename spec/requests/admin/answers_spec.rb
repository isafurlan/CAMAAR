require 'rails_helper'

RSpec.describe "Admin::Answers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/answers/index"
      expect(response).to have_http_status(:success)
    end
  end

end
