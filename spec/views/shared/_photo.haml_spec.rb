require 'spec_helper'

describe "shared/_photo" do

  before do
    @photo = photos_proxy.first
  end
  
  it "renders thumbnail and comment of photo" do
    template.should_receive( :link_to_show_photo ).with( @photo, true )
    render :locals => { :photo => @photo }
  end

end
