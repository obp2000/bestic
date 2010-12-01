require 'spec_helper'
  
describe ContactsController do
  
  before do
    controller.stub( :current_user ).and_return( users_proxy.first )
    @contact = contacts_proxy.first
  end

  describe "GET index" do
    it "assigns all contacts as @objects, first contact as @object and renders index template" do
#      Contact.stub( :all ).and_return( [ @contact ] )
#      Contact.stub( :new ).and_return( @contact )
      Contact.should_receive( :all_and_new ).and_return( [ [ @contact ], @contact ] )
      Contact.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index
      assigns[ :objects].should == [ @contact ]
      assigns[ :object ].should == @contact
      response.should render_template( "shared/index.rjs" )
    end
  end

  describe "GET show" do
    it "assigns the requested contact as @object and renders show template" do
      Contact.should_receive( :find ).with( @contact.to_param ).and_return( @contact )
      Contact.should_receive( :show_page_title ).and_return( "Контакты" )
      xhr :get, :show, :id => @contact.to_param
      assigns[ :object ].should == @contact
      assigns[ :page_title ].should == "Контакты"      
      response.should render_template( "shared/show.rjs" )      
    end
  end

  describe "PUT update" do
    it "updates the requested contact" do
      Contact.should_receive( :find ).with( @contact.to_param ).and_return( @contact )
       @contact.should_receive( :update_object ).with( { "contact" => { "name" => "Test" }, "action" => "update",
                              "id" => @contact.to_param, "controller" => "contacts" }, {} )      
      xhr :put, :update, :id => @contact.to_param, :contact => { "name" => "Test" }
    end

    context "with valid params" do
      it "assigns the requested contact as @object and renders create/update template" do
        @contact.stub( :update_object ).and_return( true )        
        Contact.stub( :find ).and_return( @contact )
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @contact )
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns the contact as @object and re-renders new/edit template" do
        @contact.stub( :update_object ).and_return( false )
        Contact.should_receive( :find ).with( @contact.to_param ).and_return( @contact )        
        xhr :put, :update, :id => @contact.to_param
        assigns[ :object ].should equal( @contact )
        response.should render_template( "shared/new_or_edit.rjs" )          
      end
    end

  end

end
