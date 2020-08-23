require "rails_helper"

RSpec.describe StarterPacksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/starter_packs").to route_to("starter_packs#index")
    end

    it "routes to #new" do
      expect(:get => "/starter_packs/new").to route_to("starter_packs#new")
    end

    it "routes to #show" do
      expect(:get => "/starter_packs/1").to route_to("starter_packs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/starter_packs/1/edit").to route_to("starter_packs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/starter_packs").to route_to("starter_packs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/starter_packs/1").to route_to("starter_packs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/starter_packs/1").to route_to("starter_packs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/starter_packs/1").to route_to("starter_packs#destroy", :id => "1")
    end
  end
end
