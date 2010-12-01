require 'spec_helper'

describe "catalog_items/_attr_with_any" do

  before(:each) do
    @object = catalog_items_proxy.first
    @attr = "size"
  end
  
  context "when catalog item has more then one size" do
    it "renders 'any' size option" do
      template.should_receive( :render_options ).exactly( 2 ).times        
      render :locals => { :object => @object, :attr => @attr }      
    end
  end
  
  context "when catalog item has only one size" do
    
    before do
      @object.stub( :sizes ).and_return( [ sizes_proxy.first ] )
    end
    
    it "do not renders 'any' size option" do
      template.should_receive( :render_options ).once
      render :locals => { :object => @object, :attr => @attr }        
    end

  end  

end
