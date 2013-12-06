require "spec_helper"

describe LaptopHistoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/laptop_histories").should route_to("laptop_histories#index")
    end

    it "routes to #new" do
      get("/laptop_histories/new").should route_to("laptop_histories#new")
    end

    it "routes to #show" do
      get("/laptop_histories/1").should route_to("laptop_histories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/laptop_histories/1/edit").should route_to("laptop_histories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/laptop_histories").should route_to("laptop_histories#create")
    end

    it "routes to #update" do
      put("/laptop_histories/1").should route_to("laptop_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/laptop_histories/1").should route_to("laptop_histories#destroy", :id => "1")
    end

  end
end
