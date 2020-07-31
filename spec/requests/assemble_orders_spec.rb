require 'rails_helper'

RSpec.describe "AssembleOrders", type: :request do
  describe "GET /assemble_orders" do
    it "works! (now write some real specs)" do
      get assemble_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
