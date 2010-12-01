require 'spec_helper'

describe CategoryCatalogItem do
  before do
    create_4_catalog_items_with_different_categories_and_seasons
    @params = { :category_id => @category1.id }
  end

  describe "#catalog_items" do

    it "lists only catalog items of @category1" do
      CategoryCatalogItem.catalog_items( @params ).count.should == 2
      CategoryCatalogItem.catalog_items( @params ).each do |catalog_item|
        catalog_item.category.name.should == @category1.name
      end
    end
 
    it "show proper page title" do
      CategoryCatalogItem.index_page_title.should == "Каталог товаров: #{CatalogItem.season_name}: #{@category1.name}"
    end
  
  end

end
