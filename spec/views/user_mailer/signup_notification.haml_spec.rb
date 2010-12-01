require 'spec_helper'

describe "user_mailer/signup_notification" do

  before(:each) do
    assigns[:user] = users_proxy.first
  end
  
  it "creates user signup notification letter" do
    render
    response.should contain( assigns[:user].login )
    response.should contain( assigns[:user].password )    
    response.should contain( url_for( :host => 'localhost:3001', :controller => "users",
          :action => "activate", :id => assigns[:user].activation_code) )
  end

end
