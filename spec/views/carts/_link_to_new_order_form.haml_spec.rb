require 'spec_helper'

describe "carts/_link_to_new_order_form" do

#  before do
#    template.stub( :do_not_show ).and_return( false )
#  end
  
#  it "renders link to new order form" do
#    render
#    response.should have_link_to_remote_get( new_processed_order_path )       
#  end

  context "when user can make order" do
    it "renders link to new order form" do
      template.stub( :do_not_show ).and_return( false )      
      render
      response.should have_link_to_remote_get( new_processed_order_path )         
    end    
  end

  context "when user can not make order" do
    it "does not render link to new order form" do
      template.stub( :do_not_show ).and_return( true )      
      render
      response.should_not have_link_to_remote_get( new_processed_order_path )          
    end    
  end

end
