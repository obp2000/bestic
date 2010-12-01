require 'spec_helper'

describe "order_notice/_order_item" do

  before(:each) do
    @object = order_items_proxy.first
  end
  
  it "renders order notice" do
    render :locals => { :order_item => @object }
    response.should contain(@object.name)
    response.should contain(@object.size.name)
    response.should contain(@object.colour.name)    
    response.should contain(@object.price.to_s)
    response.should contain(@object.amount.to_s)    
  end

end
