require 'spec_helper'

describe CartItem do
  before do
    @valid_attributes = valid_cart_item_attributes
    @session = {}
    @params = { :id => "catalog_item_1",
              :name => "Shirt",
              :blurb => "Jacket for walking",
              :price => 500,
              :created_at => Time.now,
              :updated_at => Time.now,
              :category_id => 1,
              :type => "SummerCatalogItem",
              :size_id => 1,
              :colour_id => 1,
              :photo_id => 1 }
  end

  describe "#update_object" do
    
    context "when cart has no such cart item" do
      it "adds new cart item" do
        @cart_item, success = CartItem.update_object( @params, @session )
        @session.cart.cart_items.should include( @cart_item )
        @cart_item.amount.should == 1
        success.should == true
      end
    end
    
    context "when cart has such cart item already" do
      before do
        CartItem.update_object( @params, @session )           
      end
      it "increments cart item amount" do
        CartItem.update_object( @params, @session )
        @session.cart.cart_items.first.amount == 2
      end
    end
 
  end

  describe "#destroy_object" do
    context "when cart has some such cart items" do
      before do
        @cart_item = CartItem.update_object( @params, @session ).first
        CartItem.update_object( @params, @session )
      end
      it "deletes cart item" do
        CartItem.destroy_object( { :id => @cart_item.id }, @session )
        @session.cart.cart_items.count.should == 1
        @session.cart.cart_items.first.amount.should == 1
      end
    end

    context "when cart has last such cart item" do
      before do
        @cart_item = CartItem.update_object( @params, @session ).first
      end
      it "deletes cart item" do
        CartItem.destroy_object( { :id => @cart_item.id }, @session )
        @session.cart.cart_items.count.should == 0
      end
    end  
  end

end
