require 'spec_helper'

describe "contacts/_show" do

  before do
    assigns[ :object ] = contacts_proxy.first
  end
  
  it "renders contact information" do
    render
    response.should contain( assigns[ :object ].name )
    response.should contain( assigns[ :object ].email )   
    response.should contain( assigns[ :object ].phone )
    response.should contain( assigns[ :object ].icq )    
    response.should contain( assigns[ :object ].address )
  end

end
