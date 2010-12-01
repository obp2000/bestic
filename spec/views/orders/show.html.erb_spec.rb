require 'spec_helper'

describe "orders/_show" do

  before(:each) do
    assigns[:order] = orders_proxy.first
  end
  
  it "renders existing order details" do
    render
    response.should contain(assigns[:order].id.to_s)
    response.should contain(assigns[:order].ship_to_first_name)   
    response.should contain(assigns[:order].email)
    response.should contain(assigns[:order].phone_number)
    response.should have_selector("a") do |a|
      a.should contain(assigns[:order].order_items[0].name)
    end
    response.should contain(assigns[:order].order_items[0].amount.to_s)
  end


end
