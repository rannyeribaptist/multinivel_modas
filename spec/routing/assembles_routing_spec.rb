require "rails_helper"

RSpec.describe AssemblesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/assembles").to route_to("assembles#index")
    end

    it "routes to #new" do
      expect(:get => "/assembles/new").to route_to("assembles#new")
    end

    it "routes to #show" do
      expect(:get => "/assembles/1").to route_to("assembles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/assembles/1/edit").to route_to("assembles#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/assembles").to route_to("assembles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/assembles/1").to route_to("assembles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/assembles/1").to route_to("assembles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/assembles/1").to route_to("assembles#destroy", :id => "1")
    end
  end
end
