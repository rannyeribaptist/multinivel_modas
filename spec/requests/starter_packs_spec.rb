require 'rails_helper'

RSpec.describe "StarterPacks", type: :request do
  describe "GET /starter_packs" do
    it "works! (now write some real specs)" do
      get starter_packs_path
      expect(response).to have_http_status(200)
    end
  end
end
