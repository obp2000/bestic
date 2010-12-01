require 'spec_helper'

describe "catalog_items/_header" do
  
  before do
    @first_contact = contacts_proxy.first
    Contact.stub( :first ).and_return( @first_contact )
  end
  
  it "renders search box and links" do
    render
    response.should have_selector( "form", :method => "post", :action => search_catalog_items_path ) do |form|
      form.should have_selector( "input", :type => "text" )        
      form.should have_image_input
    end
    response.should have_link_to_remote_get( forum_posts_path )
    response.should have_link_to_remote_get( contact_path( @first_contact ) )
    response.should have_selector( "a", :href => items_path )        
  end

end
