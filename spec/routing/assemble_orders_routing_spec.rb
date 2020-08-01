require "rails_helper"

RSpec.describe AssembleOrdersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/assemble_orders").to route_to("assemble_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/assemble_orders/new").to route_to("assemble_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/assemble_orders/1").to route_to("assemble_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/assemble_orders/1/edit").to route_to("assemble_orders#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/assemble_orders").to route_to("assemble_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/assemble_orders/1").to route_to("assemble_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/assemble_orders/1").to route_to("assemble_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/assemble_orders/1").to route_to("assemble_orders#destroy", :id => "1")
    end
  end
end
