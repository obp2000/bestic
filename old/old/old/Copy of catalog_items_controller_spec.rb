require 'spec_helper'

class CatalogItem; end  
  
describe CatalogItemsController do
  
  before do
    @catalog_item = catalog_items_proxy.first
  end

  describe "GET index" do
    it "assigns all catalog items as @objects, new catalog item as nil and renders index template" do
#      CatalogItem.should_receive( :catalog_items ).and_return( [ @catalog_item ] )
      CatalogItem.should_receive( :all_and_new ).and_return( [ [ @catalog_item ], nil ] )  
      CatalogItem.should_receive( :index_page_title ).and_return( "Каталог товаров: Все сезоны" )
      CatalogItem.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )      
      xhr :get, :index
      assigns[ :objects ].should == [ @catalog_item ]
      assigns[ :object ].should == nil
      assigns[ :page_title ].should == "Каталог товаров: Все сезоны"        
      response.should render_template( "shared/index.rjs" )      
    end
  end

  describe "GET show" do
    it "assigns the requested catalog item as @object and renders show template" do
      CatalogItem.should_receive( :find ).with( @catalog_item.to_param ).and_return( @catalog_item )
      CatalogItem.should_receive( :show_render ).and_return( :template => "shared/show.rjs" )       
      xhr :get, :show, :id => @catalog_item.id
      assigns[ :object ].should == @catalog_item
      response.should render_template( "shared/show.rjs" )      
    end
  end

  describe "GET search" do
    it "assigns found catalog items as @objects index template" do
      CatalogItem.should_receive( :search_results ).and_return( [ @catalog_item ] )
      CatalogItem.should_receive( :index_page_title ).and_return( "Результаты поиска по запросу" )
      CatalogItem.should_receive( :search_render ).and_return( :action => "index" )      
      xhr :get, :search
      assigns[ :objects ].should == [ @catalog_item ]
#      assigns[ :page_title ].should == "Результаты поиска по запросу"           
      response.should render_template( "shared/index.rjs" )      
    end
  end

end
