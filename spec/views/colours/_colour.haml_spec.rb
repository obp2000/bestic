require 'spec_helper'

describe "colours/_colour" do
  
  before do
    @object = colours_proxy.first    
  end
  
  it_should_behave_like "edit and new forms"    
  
  it "renders a form for edit colour" do
    template.should_receive( :render_attrs ).with( @object )
    template.should_receive( :link_to_delete ).with( @object )
    template.should_receive( :link_to_add_to_item ).with( @object )      
    render :locals => { :colour => @object }
    response.should have_selector("form", :method => "post", :action => colour_path(@object)) do |form|
      form.should have_text_field( @object, "html_code" )               
      form.should have_selector("input", :type => "color")            
      form.should have_image_input
    end
  end

  it "renders a form for a new colour" do
    @object = colours_proxy.first.as_new_record
    render :locals => { :colour => @object }
    response.should have_selector("form", :method => "post", :action => colours_path) do |form|
      form.should have_text_field( @object, "html_code" )               
      form.should have_selector("input", :type => "color")       
      form.should have_image_input
    end
  end

end