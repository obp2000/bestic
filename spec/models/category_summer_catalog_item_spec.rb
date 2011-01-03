require 'spec_helper'

describe CategorySummerCatalogItem do
  before do
    create_4_catalog_items_with_different_categories_and_seasons
    @params = { :category_id => @category1.id }       
  end

  describe "#catalog_items" do

    it "lists only catalog items of @category1 and summer season" do
      CategorySummerCatalogItem.catalog_items( @params ).count.should == 1
      CategorySummerCatalogItem.catalog_items( @params ).each do |catalog_item|
        catalog_item.type.should == "SummerCatalogItem"
        catalog_item.category.name.should == @category1.name        
      end
    end
 
    it "show proper page title" do
      CategorySummerCatalogItem.index_page_title_for( @params ).should == "Каталог товаров: #{SummerCatalogItem.season_name}: #{@category1.name}"
    end
  
  end

end
