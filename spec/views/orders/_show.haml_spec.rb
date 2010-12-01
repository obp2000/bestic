require 'spec_helper'

describe "orders/_show" do

  before(:each) do
    assigns[ :object ] = orders_proxy.first
  end
  
  it "renders existing order details" do
    template.should_receive( :render ).with( :partial => "order_item", :collection => assigns[ :object ].order_items )    
    render
    response.should contain( assigns[ :object ].to_param )
    response.should contain( assigns[ :object ].ship_to_first_name )   
    response.should contain( assigns[ :object ].email )
    response.should contain( assigns[ :object ].phone_number )
    response.should contain( assigns[ :object ].ship_to_city )
    response.should contain( assigns[ :object ].ship_to_address )
    response.should contain( assigns[ :object ].comments )    
  end

end
