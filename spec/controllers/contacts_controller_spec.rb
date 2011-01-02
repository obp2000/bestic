require 'spec_helper'

class Contact; end      
  
describe ContactsController do
  
  before do
    @object = contacts_proxy.first
  end

  it_should_behave_like "object"
  
#  describe "GET show" do
#    it "renders show page title" do
#      @object.class.stub( :find ).and_return( @object )           
#      @object.class.should_receive( :show_page_title ).and_return( "Контакты" )
#      xhr :get, :show, :id => @object.to_param
#      assigns[ :page_title ].should == "Контакты"        
#    end
#  end  

end
