require 'spec_helper'

describe Contact do
  before(:each) do
    @valid_attributes = valid_contact_attributes
    @contact = Contact.new( @valid_attributes )
    @params = { "contact" => valid_contact_attributes }
    @updated_params = { "contact" => { :name => "Sergey" } }      
    @session = {}
    @flash = {}
    @flash.stub( :now ).and_return( @flash )    
  end

  it "is valid with valid attributes" do
    @contact.should be_valid
  end

  it "is not valid without a valid name" do
    @contact.name = "N"
    @contact.should_not be_valid
  end

  it "is not valid without a valid email" do
    @contact.email = "info@m"
    @contact.should_not be_valid
  end 

  it "is not valid without a valid phone" do
    @contact.phone = "1"
    @contact.should_not be_valid
  end  
  
  describe "#update_object" do
  
    it "updates existing contact" do
      @contact = Contact.new_object( @params, @session )
      @contact.save_object( @session, @flash )
      @contact = Contact.update_object( @updated_params.merge( :id => @contact.id ), @session, @flash ).first
      @contact.name.should == @updated_params[ "contact" ][ :name ]
      @flash.now[ :notice ].should contain( "обновлены" )          
    end
  
  end

end
