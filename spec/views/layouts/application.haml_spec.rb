require 'spec_helper'

describe "layouts/application" do
  
  it "renders main page" do
    template.should_receive( :render ).with( :partial => "catalog_items/header" )
    template.should_receive( :render ).with( :partial => "catalog_items/nav" )
    render
  end

end
