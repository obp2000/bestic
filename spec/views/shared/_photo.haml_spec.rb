require 'spec_helper'

describe "shared/_photo" do

  before do
    @photo = photos_proxy.first
    @photo.stub( :link_to_show_photo_block ).and_return( lambda { |h, show_comment| h.link_to h.image_tag( @photo.public_filename( :small ) ) + 
            "Test", @photo.public_filename } )
  end
  
  it "renders thumbnail and comment of photo" do
#    template.should_receive( :link_to_show_photo ).with( @photo, true )
    render :locals => { :photo => @photo }
    response.should have_thumbnail( @photo )       
  end

end
