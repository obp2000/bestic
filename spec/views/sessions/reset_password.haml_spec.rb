require 'spec_helper'

describe "sessions/reset_password" do
  
  it "renders reset password form" do
    render
    response.should have_selector( "form", :method => "post",
                  :action => url_for( :controller => "sessions", :action => "reset_password" ) ) do |form|
      form.should have_selector( "input#user_password", :type => "password", :name => "user[password]" )
      form.should have_selector( "input#user_password_confirmation", :type => "password", :name => "user[password_confirmation]" )      
      form.should have_selector( "input", :type => "submit" )
    end
  end

end
