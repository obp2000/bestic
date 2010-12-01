require 'spec_helper'

class CatalogItem; end  
  
describe CatalogItemsController do
  
  before do
    @object = catalog_items_proxy.first
  end

  it_should_behave_like "object"
  
  it_should_behave_like "show index page title"  

  describe "GET search" do
    it "assigns found catalog items as @objects index template" do
      CatalogItem.should_receive( :search_results ).and_return( [ @object ] )
      CatalogItem.should_receive( :search_page_title ).and_return( "Результаты поиска по запросу" )
      CatalogItem.should_receive( :search_render ).and_return( :template => "shared/index.rjs" )      
      xhr :get, :search
      assigns[ :objects ].should == [ @object ]
      assigns[ :page_title ].should == "Результаты поиска по запросу"           
      response.should render_template( "shared/index.rjs" )      
    end
  end

end
