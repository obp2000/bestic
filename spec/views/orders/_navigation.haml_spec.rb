require 'spec_helper'

describe "orders/_navigation" do

  before(:each) do
    ProcessedOrder.stub( :count ).and_return( 10 )
  end
  
  it "renders navigation panel" do
    render
    response.should have_link_to_remote_get( orders_path )
    response.should have_link_to_remote_get( processed_orders_path )
    response.should have_link_to_remote_get( closed_orders_path )        
    response.should contain( ProcessedOrder.count.to_s )
  end

end
