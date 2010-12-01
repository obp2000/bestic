require 'spec_helper'

describe "catalog_items/_attr" do

  before do
    @checked = true
    @visibility = "visible"
  end

  context "check sizes" do
    
    before do
      @attr = "size"
    end
    
    it "renders sizes with radio buttons" do
      template.should_receive( :radio_button_tag_for ).with( @attr, @checked, @visibility )
      template.should_receive( :render_attrs ).with( @attr )      
      render :locals => { :attr => @attr, :checked => @checked, :visibility => @visibility }
    end

  end

end