require 'spec_helper'

describe "order_notice/order_notice" do

  before do
    assigns[ :order ] = orders_proxy.first
  end
  
  it "renders order notice" do
    template.should_receive( :render ).with( :partial => "order_notice/order_item", :collection => assigns[ :order ].order_items )
    render
    response.should contain( assigns[ :order ].ship_to_first_name )
    response.should contain( assigns[ :order ].to_param )
    response.should contain( assigns[ :order ].total.to_s )  
  end

end
