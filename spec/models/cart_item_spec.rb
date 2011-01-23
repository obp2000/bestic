require 'spec_helper'

describe CartItem do
  
  before do
    create_cart_item
  end

  describe "#update_object" do
    
    it "shows add cart item notice" do
      @flash.now[ :notice ].should contain( @cart_item.name )
      @flash.now[ :notice ].should contain( "Добавлен" )         
    end    
    
    context "when cart has no such cart item" do
      it "adds new cart item" do
        @session.cart.cart_items.should include( @cart_item )
        @cart_item.amount.should == 1
        @cart_item.name.should == @item.name
        @cart_item.price.should == @item.price             
        @success.should == true
      end
    end
    
    context "when cart has such cart item already" do
      it "increments cart item amount" do
        CartItem.update_object( @params, @session, @flash )
        @session.cart.cart_items.first.amount.should == 2
      end
    end
 
  end

  describe "#destroy_object" do
    
    it "shows delete cart item notice" do
      CartItem.destroy_object( { :id => @cart_item.id }, @session, @flash )      
      @flash.now[ :notice ].should contain( @cart_item.name )
      @flash.now[ :notice ].should contain( "Удален" )         
    end        
    
    context "when cart has some such cart items" do
      it "deletes cart item" do
        CartItem.update_object( @params, @session, @flash )        
        CartItem.destroy_object( { :id => @cart_item.id }, @session, @flash )
        @session.cart.cart_items.count.should == 1
        @session.cart.cart_items.first.amount.should == 1
      end
    end

    context "when cart has last such cart item" do
      it "deletes cart item" do
        CartItem.destroy_object( { :id => @cart_item.id }, @session, @flash )
        @session.cart.cart_items.count.should == 0
      end
    end  
  end

end
