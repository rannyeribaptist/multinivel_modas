require "rails_helper"

RSpec.describe ActivationRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/activation_requests").to route_to("activation_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/activation_requests/new").to route_to("activation_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/activation_requests/1").to route_to("activation_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/activation_requests/1/edit").to route_to("activation_requests#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/activation_requests").to route_to("activation_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/activation_requests/1").to route_to("activation_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/activation_requests/1").to route_to("activation_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/activation_requests/1").to route_to("activation_requests#destroy", :id => "1")
    end
  end
end
