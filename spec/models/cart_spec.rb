require 'spec_helper'

describe Cart do
  before do
    create_cart_item
  end

  describe "#destroy_object" do
      before do
        CartItem.update_object( @params, @session, @flash )
      end
      it "deletes all cart items" do
        @session.cart.cart_items.first.amount.should == 2
        Cart.destroy_object( @params, @session, @flash )
        @session.cart.cart_items.count.should == 0
        @flash.now[ :notice ].should contain( "Корзина" )
        @flash.now[ :notice ].should contain( "очищена" )        
      end
  end

end
