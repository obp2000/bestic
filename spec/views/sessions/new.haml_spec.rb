require 'spec_helper'

describe "sessions/new" do
  
  it "renders new user session form" do
    render
    response.should have_selector("form", :method => "post", :action => session_path ) do |form|
      form.should have_selector( "input#login", :type => "text", :name => "login" )
      form.should have_selector( "input#password", :type => "password", :name => "password" )      
      form.should have_selector( "input", :type => "submit" )
    end
    response.should have_selector( "a", :href => forgot_password_session_path )
  end

end
