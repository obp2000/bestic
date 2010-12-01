require 'spec_helper'

describe "sessions/forgot_password" do
  
  it "renders forgot password form" do
    render
    response.should have_selector("form", :method => "post", :action => forgot_password_session_path ) do |form|
      form.should have_selector( "input#email", :type => "text", :name => "email" )
      form.should have_selector( "input", :type => "submit" )
    end
  end

end
