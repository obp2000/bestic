require 'spec_helper'

describe "photos/_photo" do
  
  it "renders a form for edit photo" do
    @object = photos_proxy.first
    template.should_receive( :link_to_delete ).with( @object )    
    render :locals => { :photo => @object }
    response.should have_thumbnail( @object )     
    response.should have_selector("form", :method => "post", :action => photo_path(@object)) do |form|
      form.should have_textarea( @object, "comment" )      
      form.should have_image_input
    end
  end

end
