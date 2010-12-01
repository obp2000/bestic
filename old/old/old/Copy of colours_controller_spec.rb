require 'spec_helper'

class Colour; end    
  
describe ColoursController do
  
  before(:each) do
    controller.stub( :current_user ).and_return( users_proxy.first )
    @colour = colours_proxy.first
  end

  describe "GET index" do
    it "assigns all colours as @objects, new colour as @object and renders index template" do
#      Colour.should_receive( :paginate ).and_return( [ @colour ] )
#      Colour.should_receive( :new ).and_return( @colour )
      Colour.should_receive( :all_and_new ).and_return( [ [ @colour ], @colour ] )
      Colour.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index
      assigns[ :objects ].should == [ @colour ]
      assigns[ :object ].should == @colour
      response.should render_template( "shared/index.rjs" )
    end
  end

  describe "POST create" do
    it "creates a new colour" do
      Colour.should_receive( :new ).with( "name" => @colour.name, "html_code" => @colour.html_code ).and_return( @colour )
      @colour.should_receive( :save_object )
      xhr :post, :create, :colour => { :name => @colour.name, :html_code => @colour.html_code }
    end

    context "with valid params" do
      it "assigns a newly created colour as @object and renders create/update template" do
        @colour.stub( :save ).and_return( true )        
        Colour.stub( :new ).with( "name" => @colour.name, "html_code" => @colour.html_code ).and_return(@colour)
        Colour.should_receive( :create_render ).and_return( :template => "shared/create_or_update.rjs" )          
        xhr :post, :create, :colour => { "name" => @colour.name, :html_code => @colour.html_code }
#        flash.should_receive("now[:notice]")
        assigns[ :object ].should equal( @colour )
        response.should render_template( "shared/create_or_update.rjs" )
#        flash.now[:notice].should == 'Размер одежды создан удачно.'
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved colour as @object and re-renders new/edit template" do
        @colour.stub( :save_object ).and_return( false )
        Colour.stub(:new).with( "name" => @colour.name, "html_code" => @colour.html_code ).and_return( @colour )
        Colour.should_receive( :new_render ).and_return( :template => "shared/new_or_edit.rjs" )          
        xhr :post, :create, :colour => { "name" => @colour.name, :html_code => @colour.html_code }
        assigns[ :object ].should equal( @colour )
        response.should render_template( "shared/new_or_edit.rjs" )               
      end
    end

  end

  describe "PUT update" do
    it "updates the requested colour" do
       Colour.should_receive( :find ).with( "37" ).and_return( @colour )
       @colour.should_receive( :update_object ).with( { "colour" => { "name" => "Test", "html_code" => @colour.html_code },
                              "action" => "update", "id" => "37", "controller" => "colours" }, {} )       
       xhr :put, :update, :id => "37", :colour => { "name" => "Test", :html_code => @colour.html_code }
    end

    context "with valid params" do
      it "assigns the requested colour as @object and renders create/update template" do
        @colour.stub( :update_object ).and_return( true )        
        Colour.stub( :find ).and_return( @colour )
        Colour.should_receive( :update_render ).and_return( :template => "shared/create_or_update.rjs" )          
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @colour )
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns the colour as @object and re-renders new/edit template" do
        @colour.stub( :update_object ).and_return( false )
        Colour.stub( :find ).and_return( @colour )
        Colour.should_receive( :edit_render ).and_return( :template => "shared/new_or_edit.rjs" )          
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @colour )
        response.should render_template( "shared/new_or_edit.rjs" )          
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested colour and renders destroy template" do
      Colour.should_receive(:find).with("37").and_return(@colour)
      Colour.should_receive( :destroy_render ).and_return( :template => "shared/destroy.rjs" )        
      @colour.should_receive(:destroy)
      xhr :delete, :destroy, :id => "37"
      assigns[:object].should equal(@colour)
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
