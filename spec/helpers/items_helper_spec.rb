require 'spec_helper'

describe ItemsHelper do
 
  describe "#link_to_change" do

    it "renders link to change item attribute" do
      Size.stub( :link_to_change ).and_return( link_to_remote "Test", :url => sizes_path, :method => :get )
      helper.link_to_change( Size ).should have_link_to_remote_get( sizes_path )       
    end    
    
  end 
  
end
