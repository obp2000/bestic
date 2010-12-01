require 'spec_helper'

describe "shared/_colour" do

  before(:each) do
    @colour = items_proxy.first.colours.first
  end
  
  it "renders colour" do
    render :locals => { :colour => @colour }
    response.should have_selector( "span",
          :style => "background-color: #{@colour.html_code}; border: 1px solid black; margin-left: -0px; margin-right: 0;" )   
  end

end
