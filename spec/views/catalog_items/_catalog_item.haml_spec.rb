require 'spec_helper'

describe "catalog_items/_catalog_item" do

  before do
    @catalog_item = catalog_items_proxy.first
#    template.stub( :link_to_show ).with( @catalog_item ).and_return( link_to_remote @catalog_item.name,
#            :url => catalog_item_path( @catalog_item ), :method => :get )    
    @size = sizes_proxy.first
    @colour = colours_proxy.first
  end
  
  it "renders only one existing catalog item" do
    template.should_receive( :render ).with( :partial => "shared/photo", :collection => @catalog_item.photos )
    template.should_receive( :render ).with( :partial => "catalog_items/attr_with_any",
              :locals => { :object => @catalog_item, :attr => "size" } )
    template.should_receive( :render ).with( :partial => "catalog_items/attr_with_any",
              :locals => { :object => @catalog_item, :attr => "colour" } )
    template.should_receive( :link_to_show ).with( @catalog_item ).and_return( link_to_remote @catalog_item.name,
              :url => catalog_item_path( @catalog_item ), :method => :get )                
    render :locals => { :catalog_item => @catalog_item }
    response.should have_link_to_remote_get( catalog_item_path( @catalog_item ) ) do |a|
      a.should contain( @catalog_item.name  )      
    end
    response.should contain( @catalog_item.price.to_s )
#    response.should contain( @catalog_item.name )
    response.should have_selector( "form", :method => "post", :action => cart_item_path(@catalog_item) ) do |form|
      form.should have_image_input
    end
    response.should contain( @catalog_item.blurb )
  end

end
