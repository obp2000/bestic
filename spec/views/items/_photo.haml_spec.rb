require 'spec_helper'

describe "items/_photo" do

  before(:each) do
    @photo = photos_proxy.first
    template.stub( :link_to_show_photo ).with( @photo ).and_return( link_to image_tag( @photo.public_filename( :small ) ),
          @photo.public_filename )
  end
  
  it "renders photo in form for item" do
    template.should_receive( :link_to_remove_from_item ).with( @photo.class )     
    render :locals => { :photo => @photo }
    response.should have_thumbnail( @photo )       
    response.should have_selector( "textarea", :content => @photo.comment )
    response.should have_item_checkbox( @photo )    
  end

end
