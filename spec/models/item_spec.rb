require 'spec_helper'

describe Item do
  
  before do
    @valid_attributes = valid_item_attributes
    @item = Item.new( @valid_attributes )
    @params = { "item" => valid_item_attributes }
    @updated_params = { "item" => { :name => "Jacket",
            :blurb => "Jacket for walking",
            :price => "500",
            :category_id => 1,
            :type => "SummerCatalogItem" 
            } }    
    @session = {}
    @flash = {}
    @flash.stub( :now ).and_return( @flash )      
  end

  it "is valid with valid attributes" do
    @item.should be_valid
  end

  it "is not valid without a name" do
    @item.name = nil
    @item.should_not be_valid
  end

  it "is not valid without a price" do
    @item.price = nil
    @item.should_not be_valid
  end  
  
  it "is not valid without a valid price" do
    @item.price = "5.45"
    @item.should_not be_valid
  end    
  
  it "is not valid without a category" do
    @item.category = nil
    @item.should_not be_valid
  end    

   it "is not valid without a season" do
    @item.type = nil
    @item.should_not be_valid
  end 

  describe "#new_object" do
  
    it "builds new item" do
      @item = Item.new_object( @params, @session )
      @item.name.should == "Shirt"
    end
  
  end
 
  describe "#save_object" do
  
    it "saves new item" do
      create_item
      @item.reload
      @item.name.should == valid_item_attributes[ :name ]
      @flash.now[ :notice ].should contain( "создан" )        
    end
  
  end  
  
  describe "#update_object" do
  
    it "updates existing item" do
      create_item
      @item = Item.update_object( @updated_params.merge( :id => @item.id ), @session, @flash ).first
      @item.name.should == @updated_params[ "item" ][ :name ]
      @flash.now[ :notice ].should contain( "обновлён" )        
    end
  
  end
  
  describe "#destroy_object" do
  
    it "destroys existing item" do
      create_item
      @params_for_destroy = { :id => @item.id }
      @item = Item.destroy_object( @params_for_destroy, @session, @flash )
      @item.name.should == valid_item_attributes[ :name ]
      Item.all.should_not include( @item )
      @flash.now[ :notice ].should contain( "удалён" )         
    end
  
  end

  describe "#item_objects" do
    
    before do
      create_4_catalog_items_with_different_categories_and_seasons      
    end
    
    it "sorts by name" do
      @params = {  :sort_by => "name" }
      @items = Item.item_objects( @params )
      @items.first.name.should == "Jacket"
    end
    
    it "sorts by price" do
      @params = {  :sort_by => "price" }
      @items = Item.item_objects( @params )
      @items.first.price.should == 300
    end    
    
    it "sorts by category" do
      @params = {  :sort_by => "category.name" }
      @items = Item.item_objects( @params )
      @items.first.category.name.should == "Jackets"
    end      
    
    it "sorts by sizes" do
      @params = {  :sort_by => "sizes.first.name" }
      @items = Item.item_objects( @params )
      @items.first.sizes.first.name.should == "L"
    end    

    it "sorts by colours" do
      @params = {  :sort_by => "colours.first.name" }
      @items = Item.item_objects( @params )
      @items.first.colours.first.name.should == "Green"
    end        
    
  end

end
