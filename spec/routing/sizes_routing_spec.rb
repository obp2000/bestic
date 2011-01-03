require 'spec_helper'

describe SizesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/sizes" }.should route_to(:controller => "sizes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sizes/new" }.should route_to(:controller => "sizes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sizes/1" }.should route_to(:controller => "sizes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sizes/1/edit" }.should route_to(:controller => "sizes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sizes" }.should route_to(:controller => "sizes", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/sizes/1" }.should route_to(:controller => "sizes", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sizes/1" }.should route_to(:controller => "sizes", :action => "destroy", :id => "1") 
    end
  end
end
