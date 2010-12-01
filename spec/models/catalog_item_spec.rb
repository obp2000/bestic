require 'spec_helper'

describe CatalogItem do
  
  before do
    @catalog_item1 = Item.create!( valid_item_attributes )
    @catalog_item2 = Item.create!( valid_item_attributes )
    @params = {}
  end

  describe "#catalog_items" do

    it "lists all catalog items" do
      CatalogItem.catalog_items( @params ).count.should == 2
    end
  
  end
 
  describe "#index_page_title" do 
  
    it "show proper page title" do
      CatalogItem.index_page_title.should == "Каталог товаров: #{CatalogItem.season_name}"
    end
  
  end

  context "when resuls is found" do  

    before do
      CatalogItem.stub( :search ).and_return( [ @catalog_item1 ] )
      @params[ :q ] = "Test"        
    end  
  
    describe "#search_results" do
     
      it "lists search results" do
        CatalogItem.search_results( @params ).count.should == 1
        CatalogItem.search_results( @params ).first.name.should == @catalog_item1.name      
      end  

    end

    describe "#search_page_title" do

      it "show search page title" do
        CatalogItem.search_results( @params )      
        CatalogItem.search_page_title.should =~ /Test.*: 1/       
      end  

    end

  end

  context "when resuls is not found" do
      
    before do
      CatalogItem.stub( :search ).and_return( [] )
      @params[ :q ] = "Test"        
    end
      
    it "renders empty list of results" do
      CatalogItem.search_results( @params ).should be_empty
    end  

    describe "#search_page_title" do

      it "show search page title" do
        CatalogItem.search_results( @params )      
        CatalogItem.search_page_title.should =~ /не найден/
      end  

    end

  end

end
