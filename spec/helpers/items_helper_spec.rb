require 'spec_helper'

describe ItemsHelper do
 
  describe "#link_to_remove_photo_from_item" do

    it "renders link to function for removing photo from item" do
      @object = photos_proxy.first
      helper.should_receive( :link_to_function )
      helper.link_to_remove_photo_from_item      
    end    
    
  end 
  
end
