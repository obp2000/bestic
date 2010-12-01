require 'spec_helper'

describe "processed_orders/_new" do

  before(:each) do
    assigns[:object] = processed_orders_proxy.first.as_new_record
#    template.stub( :captcha_block )
  end
  
  it "renders new order form" do
    template.should_receive( :captcha_block )
    render
    response.should have_selector( "form#new_processed_order", :method => "post", :action => processed_orders_path ) do |form|
      form.should have_text_field( assigns[:object], "email" )
      form.should have_text_field( assigns[:object], "phone_number" )
      form.should have_text_field( assigns[:object], "ship_to_first_name" )        
      form.should have_text_field( assigns[:object], "ship_to_city" )
      form.should have_textarea( assigns[:object], "ship_to_address" )      
      form.should have_textarea( assigns[:object], "comments" )    
    end

  end

end
