require 'spec_helper'

describe "shared/_photo" do

  before do
    @photo = photos_proxy.first
    template.stub( :link_to_show_photo_with_comment ).with( @photo ).and_return( link_to image_tag( 
              @photo.public_filename( :small ) ) + @photo.comment, @photo.public_filename  )
  end
  
  it "renders thumbnail and comment of photo" do
    render :locals => { :photo => @photo }
    response.should have_thumbnail( @photo )
    response.should contain( @photo.comment )     
  end

end
