require 'spec_helper'

describe "photos/_photo" do
  
  it "renders a form for edit photo" do
    @object = photos_proxy.first
    @object.stub( :link_to_delete_block ).and_return( lambda { |h| h.link_to_remote "Test",
            :url => photo_path( @object ), :method => :delete } )
    @object.stub( :link_to_show_photo_block ).and_return( lambda { |h, show_comment| h.link_to h.image_tag( @object.public_filename( :small ) ) + 
            "Test", @object.public_filename } )
#page.link_to page.image_tag( public_filename( :small ) ) + ( show_comment ? comment || "" : "" ), public_filename            
#    template.should_receive( :link_to_show_photo ).with( @object, false )       
#    template.should_receive( :link_to_delete ).with( @object )    
    render :locals => { :photo => @object }
    response.should have_thumbnail( @object )     
    response.should have_selector("form", :method => "post", :action => photo_path(@object)) do |form|
      form.should have_textarea( @object, "comment" )      
      form.should have_image_input
    end
    response.should have_text( regexp_for_remote_delete( photo_path( @object ) ) )       
  end

end
