require 'spec_helper'

describe "carts/_link_to_new_order_form" do

  before do
    template.stub( :do_not_show ).and_return( false )
  end
  
  it "renders link to new order form" do
    render
    response.should have_link_to_remote_get( new_processed_order_path )       
  end

end
