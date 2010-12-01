require 'spec_helper'

describe "items/_item" do

  before do
    @item = items_proxy.first
  end
  
  it "renders item" do
    template.should_receive( :render_attrs ).with( @item.sizes )
    template.should_receive( :render_attrs ).with( @item.colours )  
    template.should_receive( :link_to_delete ).with( @item )    
    render :locals => { :item => @item }
    response.should have_selector( "tr", :onclick => "$.get('#{edit_item_path(@item)}')" )
    response.should contain(@item.name)
    response.should contain(@item.category.name)
    response.should contain(@item.price.to_s)
  end

end
