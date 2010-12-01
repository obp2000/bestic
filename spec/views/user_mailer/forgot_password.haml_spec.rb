require 'spec_helper'

describe "user_mailer/forgot_password" do

  before(:each) do
    assigns[:user] = users_proxy.first
  end
  
  it "creates user password reset letter" do
    render
    response.should contain( assigns[:user].login )
    response.should contain( url_for( :host => 'localhost:3001', :controller => "sessions",
          :action => "reset_password", :id => assigns[:user].pw_reset_code) )
  end

end
