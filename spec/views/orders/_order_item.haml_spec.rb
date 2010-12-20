require 'spec_helper'

describe "orders/_order_item" do

  before(:each) do
    @order_item = order_items_proxy.first
    template.stub( :link_to_show ).with( @order_item ).and_return( link_to_remote @order_item.name,
            :url => item_path( @order_item.item ), :method => :get )       
  end
  
  it "renders order" do
#    template.should_receive( :render_attrs ).with( @order_item.size )      
#    template.should_receive( :render_attrs ).with( @order_item.colour )      
    render :locals => { :order_item => @order_item }
    response.should have_link_to_remote_get( item_path( @order_item.item ) ) do |a|
      a.should contain( @order_item.name )      
    end
    response.should contain(@order_item.size.name)
    response.should have_text(/#{@order_item.colour.html_code}/)    
    response.should contain(@order_item.amount.to_s)
    response.should contain(@order_item.order_item_sum.to_s)
  end

end
