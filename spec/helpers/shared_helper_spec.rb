require 'spec_helper'

describe SharedHelper do

  describe "#link_to_close_window( object )" do

    it "renders link to function for close window" do
      @object = sizes_proxy.first
      helper.should_receive( :link_to_function )
      helper.link_to_close_window( @object )      
    end    
    
  end   
  
end
