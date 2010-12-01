require 'spec_helper'

class CatalogItem; end

describe "catalog_items/_nav" do

  before do
    Category.stub( :all_of ).and_return( categories_proxy )    
  end
  
  it "renders nav with seasons and categories" do
    template.should_receive( :link_to_season ).exactly( 3 ).times
    Category.should_receive( :all_of ).exactly( 3 ).times   
    template.should_receive( :link_to_category ).exactly( Category.all_of.count * 3 ).times
    template.should_receive( :set_drop_receiving_element ).with( "cart" ).once    
    render

  end

  it "renders cart" do
    template.should_receive(:render).with( :partial => "carts/cart" )
    render
    response.should have_selector( "a", :content => "Корзина" )
    
  
  end

end
