require 'spec_helper'

describe "items/_colour" do

  before do
    @colour = colours_proxy.first
  end
  
  it "renders colour in form for item" do
    template.should_receive( :render ).with( :partial => "shared/colour", :object => @colour )    
    render :locals => { :colour => @colour }
    response.should have_item_checkbox( @colour )      
  end

end
