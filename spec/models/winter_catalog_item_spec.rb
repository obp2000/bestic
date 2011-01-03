require 'spec_helper'

describe WinterCatalogItem do
  before do
    create_4_catalog_items_with_different_categories_and_seasons
    @params = {}
  end

  describe "#catalog_items" do

    it "lists only winter catalog items" do
      WinterCatalogItem.catalog_items( @params ).count.should == 2
      WinterCatalogItem.catalog_items( @params ).first.type.should == "WinterCatalogItem"   
    end
 
    it "show proper page title" do
      WinterCatalogItem.index_page_title_for( @params ).should == "Каталог товаров: #{WinterCatalogItem.season_name}"
    end
  
  end

end
