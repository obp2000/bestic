require 'spec_helper'

describe "catalog_items/_size" do

  before(:each) do
    @size = items_proxy.first.sizes.first
  end
  
  it "renders size of catalog item" do
    render :locals => { :size => @size, :checked => "checked", :visibility => "visible" }
    response.should have_radio_button( @size )    
    response.should contain( @size.name )    
  end

end
