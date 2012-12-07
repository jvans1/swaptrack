require "spec_helper"

describe LastlongersController do
  describe "routing" do

    it "routes to #index" do
      get("/lastlongers").should route_to("lastlongers#index")
    end

    it "routes to #new" do
      get("/lastlongers/new").should route_to("lastlongers#new")
    end

    it "routes to #show" do
      get("/lastlongers/1").should route_to("lastlongers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lastlongers/1/edit").should route_to("lastlongers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lastlongers").should route_to("lastlongers#create")
    end

    it "routes to #update" do
      put("/lastlongers/1").should route_to("lastlongers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lastlongers/1").should route_to("lastlongers#destroy", :id => "1")
    end

  end
end
