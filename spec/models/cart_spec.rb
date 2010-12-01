require 'spec_helper'

describe Cart do
  before do
    create_cart_item
  end

  describe "#destroy_object" do
      before do
        CartItem.update_object( @params, @session )
      end
      it "deletes all cart items" do
        @session.cart.cart_items.first.amount.should == 2
        Cart.destroy_object( @params, @session )
        @session.cart.cart_items.count.should == 0
      end
  end

end
