require 'rails_helper'

RSpec.describe "SupportTickets", type: :request do
  describe "GET /support_tickets" do
    it "works! (now write some real specs)" do
      get support_tickets_path
      expect(response).to have_http_status(200)
    end
  end
end
