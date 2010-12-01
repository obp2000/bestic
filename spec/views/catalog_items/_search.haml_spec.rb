require 'spec_helper'

describe "catalog_items/_search" do
  
  it "renders photo and comment of catalog item" do
    template.should_receive( :render ).with( :partial => "index" )     
    render
   end

end
