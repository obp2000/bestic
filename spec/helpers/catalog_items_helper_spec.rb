require 'spec_helper'

describe CatalogItemsHelper do

  describe "#radio_button_tag_for( attr, checked, visibility )" do
    
    before do
      @size = catalog_items_proxy.first.sizes.first
    end
    
    it "renders radio button tag for attr" do
      helper.radio_button_tag_for( @size, true, "visible" ).should have_radio_button( @size )
    end
  
  end
 
end
