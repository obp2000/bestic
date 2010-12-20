require 'spec_helper'

def Cart; end

describe "carts/_cart" do

  before do
    template.stub( :do_not_show ).and_return( false )
    @session = { :cart => carts_proxy.first }
  end
  
  it "renders cart with only one cart item" do
    template.should_receive( :render ).with( :partial => "cart_items/cart_item", :collection => @session.cart.cart_items )
    template.should_receive( :render ).with( :partial => "carts/link_to_new_order_form" )
    template.should_receive( :render ).with( :partial => "carts/link_to_clear_cart" )        
    render :locals => { :session => @session }
#    response.should have_link_to_remote_get( new_processed_order_path )       
    response.should contain( @session.cart.total_items.to_s )
    response.should contain( @session.cart.total_sum.to_s )
#    response.should have_text( regexp_for_remote_delete( cart_path ) )       
  end

end
