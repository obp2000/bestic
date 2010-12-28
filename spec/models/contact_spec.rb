require 'spec_helper'

describe Contact do
  before(:each) do
    @valid_attributes = valid_contact_attributes
    @contact = Contact.first
  end

  it "is valid with valid attributes" do
    p @contact
    @contact.should be_valid
  end

  it "is not valid without a valid name" do
    @contact.name = "N"
    @contact.should_not be_valid
#    @contact.should have( 1 ).error_on( :name )    
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
  
    before do
      @params = { "contact" => valid_contact_attributes }
      @updated_params = { "contact" => { :name => "Sergey" } }      
      @session = {}
    end
  
    it "updates existing contact" do
      @contact = Contact.new_object( @params, @session )
      @contact.save_object( @session )
      @contact = Contact.update_object( @updated_params.merge( :id => @contact.id ), @session ).first
      @contact.name.should == @updated_params[ "contact" ][ :name ]
    end
  
  end

end
