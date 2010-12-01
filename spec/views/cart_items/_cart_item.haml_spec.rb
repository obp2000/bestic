require 'spec_helper'

describe "cart_items/_cart_item" do

  before do
     @cart_item = cart_items_proxy.first
     template.stub( :do_not_show ).and_return( false )
  end
  
  it "renders cart item" do
    template.should_receive( :render_attrs ).with( @cart_item.size )
    template.should_receive( :render_attrs ).with( @cart_item.colour )      
    template.should_receive( :link_to_delete ).with( @cart_item )    
    render :locals => { :cart_item => @cart_item }
    response.should have_link_to_remote_get( catalog_item_path(@cart_item.item) ) do |a|
      a.should contain( @cart_item.name )      
    end
    response.should contain(@cart_item.price.to_s)
    response.should contain(@cart_item.amount.to_s)
  end

end
