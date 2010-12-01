require 'spec_helper'

describe "users/new" do

  before do
    assigns[ :user ] = users_proxy.first.as_new_record
  end
  
  it "renders new user form" do
    render
    response.should have_selector("form#new_user", :method => "post", :action => users_path ) do |form|
      form.should have_text_field( assigns[:user], "login" )
      form.should have_text_field( assigns[:user], "email" )
      form.should have_text_field( assigns[:user], "last_name" )
      form.should have_text_field( assigns[:user], "first_name" )
      form.should have_password_field( assigns[:user], "password" )
      form.should have_password_field( assigns[:user], "password_confirmation" )        
      form.should have_selector( "input", :type => "submit" )
    end
  end

end
