require 'spec_helper'

describe "shared/_size" do

  before(:each) do
    @size = items_proxy.first.sizes.first
  end
  
  it "renders size name" do
    render :locals => { :size => @size }
    response.should contain( @size.name )   
  end

end
