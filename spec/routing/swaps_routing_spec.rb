require "spec_helper"

describe SwapsController do
  describe "routing" do

    it "routes to #index" do
      get("/swaps").should route_to("swaps#index")
    end

    it "routes to #new" do
      get("/swaps/new").should route_to("swaps#new")
    end

    it "routes to #show" do
      get("/swaps/1").should route_to("swaps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/swaps/1/edit").should route_to("swaps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/swaps").should route_to("swaps#create")
    end

    it "routes to #update" do
      put("/swaps/1").should route_to("swaps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/swaps/1").should route_to("swaps#destroy", :id => "1")
    end

  end
end
