require 'spec_helper'

class CartItem; end
  
describe CartItemsController do
  
  before do
    @cart_item = cart_items_proxy.first
  end

  describe "PUT update" do
    it "adds the requested cart item to cart and renders create_or_update template" do
      CartItem.should_receive( :update_object ).and_return( [ @cart_item, true ] )
      CartItem.should_receive( :update_render ).and_return( :template => "shared/create_or_update.rjs" )      
      xhr :put, :update, :id => @cart_item.id
      assigns[ :object ].should equal( @cart_item )      
      response.should render_template( "shared/create_or_update.rjs" )
    end
  end

  describe "DELETE destroy" do
    it "deletes the requested cart item from cart and renders create_or_update template" do
      CartItem.should_receive( :destroy_object ).and_return( @cart_item )      
      CartItem.should_receive( :destroy_render ).and_return( :template => "shared/create_or_update.rjs" )
      xhr :delete, :destroy, :id => @cart_item.id
      assigns[:object].should equal( @cart_item )      
      response.should render_template( "shared/create_or_update.rjs" )
    end
  end

end
