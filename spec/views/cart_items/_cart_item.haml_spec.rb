require 'spec_helper'

class CartItem; end

describe "cart_items/_cart_item" do

  before do
    @cart_item = cart_items_proxy.first
#    @cart_item = stub_model( CartItem )
    template.stub( :link_to_show ).with( @cart_item.catalog_item ).and_return( link_to_remote @cart_item.name,
            :url => catalog_item_path( @cart_item.catalog_item ), :method => :get )
    template.stub( :link_to_delete ).with( @cart_item ).and_return( link_to_remote "Test",
            :url => cart_item_path( @cart_item ), :method => :delete )             
  end
  
  it "renders cart item" do
    render :locals => { :cart_item => @cart_item }
    response.should have_link_to_remote_get( catalog_item_path(@cart_item.catalog_item) ) do |a|
      a.should contain( @cart_item.name )      
    end
    response.should contain( @cart_item.size.name )
    response.should have_text( /#{@cart_item.colour.html_code}/ )     
    response.should contain( @cart_item.price.to_s )
    response.should contain( @cart_item.amount.to_s )
  end

  context "when user can delete cart item" do
    it "renders delete button" do
      template.stub( :do_not_show ).and_return( false )      
      render :locals => { :cart_item => @cart_item }
      response.should have_text( regexp_for_remote_delete( cart_item_path( @cart_item ) ) )
    end    
  end
  
  context "when user can not delete cart item" do
    it "does not render delete button" do
      template.stub( :do_not_show ).and_return( true )      
      render :locals => { :cart_item => @cart_item }
      response.should_not have_text( regexp_for_remote_delete( cart_item_path( @cart_item ) ) )
    end    
  end  

end
