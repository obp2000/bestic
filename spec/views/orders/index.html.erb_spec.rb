require 'spec_helper'

describe "orders/_index" do

  before(:each) do
    assigns[:orders] = orders_proxy
    template.stub(:will_paginate)
  end
  
  it "renders existing order" do
    render
    response.should contain(assigns[:orders][0].id.to_s)
    response.should contain(assigns[:orders][0].status)
    response.should contain(assigns[:orders][0].total.to_s)
    response.should contain(assigns[:orders][0].items.size.to_s)
    response.should contain(assigns[:orders][0].created_at.strftime("%d.%m.%y"))
    response.should contain(assigns[:orders][0].created_at.strftime("%H:%M:%S"))          
  end


end
