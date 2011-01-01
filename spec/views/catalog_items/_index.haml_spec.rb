require 'spec_helper'

describe "catalog_items/_index" do

  before do
    assigns[:objects] = catalog_items_proxy
  end
  
  it "renders collection of only one existing catalog item" do
    template.should_receive( :index_page_title_for ).with( CatalogItem )         
    template.should_receive( :render ).with( :partial => "catalog_items/catalog_item", :collection => assigns[:objects] )
    template.should_receive( :will_paginate ).with( assigns[:objects] )    
    render
  end

end
