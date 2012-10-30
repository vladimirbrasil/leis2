require "spec_helper"

describe ClassesController do
  describe "routing" do

    it "routes to #index" do
      get("/classes").should route_to("classes#index")
    end

    it "routes to #new" do
      get("/classes/new").should route_to("classes#new")
    end

    it "routes to #show" do
      get("/classes/1").should route_to("classes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/classes/1/edit").should route_to("classes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/classes").should route_to("classes#create")
    end

    it "routes to #update" do
      put("/classes/1").should route_to("classes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/classes/1").should route_to("classes#destroy", :id => "1")
    end

  end
end
