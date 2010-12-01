require 'spec_helper'

describe "items/_index" do

  before(:each) do
    assigns[:items] = items_proxy
    template.stub(:will_paginate)
  end
  
  it "renders existing item" do
    render :locals => { :collection => assigns[:items] }
    response.should contain(assigns[:items][0].name)
    response.should contain(assigns[:items][0].sizes[0].name)
#    response.should contain(assigns[:items][0].colours[0].html_code)
    response.should have_selector("span", :style => "background-color: #{assigns[:items][0].colours[0].html_code}; border: 1px solid black; margin-left: -0px; margin-right: 0;" )
    response.should contain(assigns[:items][0].category.name)
    response.should contain(assigns[:items][0].price.to_s)
  end

end
