require "spec_helper"

describe WebIssuesController do
  describe "routing" do

    it "routes to #index" do
      get("/web_issues").should route_to("web_issues#index")
    end

    it "routes to #new" do
      get("/web_issues/new").should route_to("web_issues#new")
    end

    it "routes to #show" do
      get("/web_issues/1").should route_to("web_issues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/web_issues/1/edit").should route_to("web_issues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/web_issues").should route_to("web_issues#create")
    end

    it "routes to #update" do
      put("/web_issues/1").should route_to("web_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/web_issues/1").should route_to("web_issues#destroy", :id => "1")
    end

  end
end
