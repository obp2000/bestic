require 'spec_helper'

describe "items/_category" do

  before(:each) do
    @category = categories_proxy.first
  end
  
  it "renders category in form for item" do
    render :locals => { :category => @category }
    response.should have_selector( "input#item_category_id", :type => "hidden", :name => "item[category_id]",
          :value => @category.to_param )
    response.should contain( @category.name )          
  end

end
