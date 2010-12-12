require 'spec_helper'

describe "items/_item" do

  before do
    @item = items_proxy.first
    @item.stub( :link_to_delete_block ).and_return( lambda { |h| h.link_to_remote "Test",
            :url => item_path( @item ), :method => :delete } )       
  end
  
  it "renders item" do
    template.should_receive( :render_attrs ).with( @item.sizes )
    template.should_receive( :render_attrs ).with( @item.colours )  
#    template.should_receive( :link_to_delete ).with( @item )    
    render :locals => { :item => @item }
    response.should have_selector( "tr", :onclick => "$.get('#{edit_item_path(@item)}')" )
    response.should contain(@item.name)
    response.should contain(@item.category.name)
    response.should contain(@item.price.to_s)
    response.should have_text( regexp_for_remote_delete( item_path( @item ) ) )       
  end

end
