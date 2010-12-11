require 'spec_helper'

describe "items/_photo" do

  before(:each) do
    @photo = photos_proxy.first
  end
  
  it "renders photo in form for item" do
    template.should_receive( :link_to_show_photo ).with( @photo, false )
    template.should_receive( :link_to_remove_from_item ).with( @photo.class )     
    render :locals => { :photo => @photo }
#    response.should have_textarea( @photo, "comment" )
    response.should have_selector( "textarea", :content => @photo.comment )
    response.should have_item_checkbox( @photo )    
  end

end
