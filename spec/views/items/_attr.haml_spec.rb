require 'spec_helper'

describe "items/_attr" do

  before do
    @checked = true
    @visibility = "visible"
  end

  context "check sizes" do
    
    before do
      @attr = items_proxy.first.sizes.first
    end
    
    it "renders sizes with check buttons" do
      template.should_receive( :render_attrs ).with( @attr )      
      render :locals => { :attr => @attr }
      response.should have_item_checkbox( @attr )
    end

  end

end