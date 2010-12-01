require 'spec_helper'

describe "catalog_items/_colour" do

  before do
    @colour = catalog_items_proxy.first.colours.first
  end
  
  it "renders colour of catalog item" do
    template.should_receive(:render).with( :partial => "shared/colour", :object => @colour )
    render :locals => { :colour => @colour, :checked => "checked", :visibility => "visible" }
    response.should have_radio_button( @colour )        
  end

end
