require 'spec_helper'

describe "user_mailer/activation" do

  before(:each) do
    assigns[:user] = users_proxy.first
  end
  
  it "creates user activation letter" do
    render
    response.should contain( assigns[:user].login )
    response.should contain( url_for( :host => 'localhost:3001', :controller => "sessions",  :action => "create",
          :user => assigns[:user].login, :password => assigns[:user].password )  )
  end

end
