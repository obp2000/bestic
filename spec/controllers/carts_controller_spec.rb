require 'spec_helper'

class Cart; end  
  
describe CartsController do
  
  before do
    @cart = carts_proxy.first
  end

  describe "DELETE destroy" do
    it "clears the requested cart and renders destroy template" do
      Cart.should_receive( :destroy_object ).and_return( @cart.cart_items )
#      controller.should_receive( :render_block_call ).and_return( controller.render :template => "shared/destroy.rjs" )
      xhr :delete, :destroy
      assigns[ :object ].should equal( @cart.cart_items )      
      response.should render_template( "shared/destroy.rjs" )
    end

  end

end
