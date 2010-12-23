require 'spec_helper'

describe CartItem do
  
  before do
    create_cart_item
  end

  describe "#update_object" do
    
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
        CartItem.update_object( @params, @session )
        @session.cart.cart_items.first.amount.should == 2
      end
    end
 
  end

  describe "#destroy_object" do
    context "when cart has some such cart items" do
      it "deletes cart item" do
        CartItem.update_object( @params, @session )        
        CartItem.destroy_object( { :id => @cart_item.id }, @session )
        @session.cart.cart_items.count.should == 1
        @session.cart.cart_items.first.amount.should == 1
      end
    end

    context "when cart has last such cart item" do
      it "deletes cart item" do
        CartItem.destroy_object( { :id => @cart_item.id }, @session )
        @session.cart.cart_items.count.should == 0
      end
    end  
  end

  describe "#link_to_show( page )" do
  
    it "creates link to show" do
#      create_cart_item
#      page = ApplicationHelper
      @cart_item.link_to_show( ActionView::Base.new ).should == 11
#      p "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    end  
  
  end


end
