require 'spec_helper'

describe "orders/_new" do

  before(:each) do
    assigns[:order] = orders_proxy.first.as_new_record
    template.stub(:captcha_block)
  end
  
  it "renders new order form" do
    template.should_receive(:captcha_block)
    render
    response.should have_selector("form#new_order", :method => "post", :action => orders_path ) do |form|
      form.should have_selector( "input#order_email", :type => "text",
            :name => "order[email]", :value => assigns[:order].email )
      form.should have_selector( "input#order_phone_number", :type => "text",
            :name => "order[phone_number]", :value => assigns[:order].phone_number )
      form.should have_selector( "input#order_ship_to_first_name", :type => "text",
            :name => "order[ship_to_first_name]", :value => assigns[:order].ship_to_first_name )            
      form.should have_selector( "input#order_ship_to_city", :type => "text",
            :name => "order[ship_to_city]", :value => assigns[:order].ship_to_city )            
      form.should have_selector( "textarea#order_ship_to_address", :name => "order[ship_to_address]",
            :content => assigns[:order].ship_to_address )
      form.should have_selector( "textarea#order_comments", :name => "order[comments]",
            :content => assigns[:order].comments )
      form.should have_selector( "input", :type => "submit" )
    end
  end

end
