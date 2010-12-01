require 'spec_helper'

describe "items/_size" do

  before(:each) do
    @size = sizes_proxy.first
  end
  
  it "renders size in form for item" do
    render :locals => { :size => @size }
    response.should have_item_checkbox( @size )
    response.should contain( @size.name )          
  end

end
