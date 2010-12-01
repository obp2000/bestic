require 'spec_helper'

class Contact; end

describe "contacts/_contact" do
  
  before do
    @object = contacts_proxy.first
  end
  
  it "renders a form for edit object" do
    render :locals => { @object.class.name.underscore.to_sym => @object }
    response.should have_selector("form", :method => "post", :action => send( "#{@object.class.name.underscore}_path", @object ) ) do |form|
      form.should have_text_field( @object, "name" )
      form.should have_text_field( @object, "email" )
      form.should have_text_field( @object, "phone" )
      form.should have_text_field( @object, "icq" )
      form.should have_textarea( @object, "address" )         
      form.should have_image_input
    end
  end

end
