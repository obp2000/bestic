require 'spec_helper'

class CatalogItem; end

describe "catalog_items/_show" do

  before(:each) do
    assigns[:object] = catalog_items_proxy.first
  end
  
  it "shows only one existing catalog item's details" do
    template.should_receive( :link_to_back )            
    template.should_receive(:render).with( :partial => "photo", :collection => assigns[:object].photos )
    template.should_receive( :render ).with( :partial => "catalog_items/attr_with_any",
              :locals => { :object => assigns[:object], :attr => "size" } )
    template.should_receive( :render ).with( :partial => "catalog_items/attr_with_any",
              :locals => { :object => assigns[:object], :attr => "colour" } )                              
    CatalogItem.should_receive( :season_name ).and_return( "Весна/Лето" )
    render
    response.should contain( assigns[:object].name )
    response.should contain( assigns[:object].price.to_s )
    response.should contain( assigns[:object].category.name )
    response.should contain( CatalogItem.season_name )
    response.should have_selector( "form", :method => "post", :action => cart_item_path(assigns[:object]) ) do |form|
      form.should have_image_input
    end
    response.should contain( assigns[:object].blurb )
  end

end
