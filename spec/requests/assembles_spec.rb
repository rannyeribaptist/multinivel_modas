require 'rails_helper'

RSpec.describe "Assembles", type: :request do
  describe "GET /assembles" do
    it "works! (now write some real specs)" do
      get assembles_path
      expect(response).to have_http_status(200)
    end
  end
end
