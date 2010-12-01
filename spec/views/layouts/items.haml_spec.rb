require 'spec_helper'

describe "layouts/items" do
  
  it "renders main admin page" do
    render
    response.should have_link_to_remote_get( orders_path )    
    response.should have_link_to_remote_get( items_path )
    response.should have_link_to_remote_get( contacts_path )
    response.should have_selector( "a", :href => catalog_items_path )        
  end

end
