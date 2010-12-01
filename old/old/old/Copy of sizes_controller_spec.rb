require 'spec_helper'
  
describe SizesController do
  
  before do
    controller.stub(:current_user).and_return( users_proxy.first )
    @size = sizes_proxy.first
  end

  describe "GET index" do
    it "assigns all sizes as @objects, new size as @object and renders index template" do
#      Size.should_receive( :all ).and_return( [ @size ] )
#      Size.should_receive( :new ).and_return( @size )
      Size.should_receive( :all_and_new ).and_return( [ [ @size ], @size ] )
      Size.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index
      assigns[ :objects ].should == [ @size ]
      assigns[ :object ].should == @size
      response.should render_template( "shared/index.rjs" )      
    end
  end

  describe "POST create" do
    it "creates a new size" do
      Size.should_receive( :new ).and_return( @size )
      @size.should_receive( :save_object )
      xhr :post, :create, :size => { :name => @size.name }
    end

    context "with valid params" do
      it "assigns a newly created size as @object and renders create/update template" do
        @size.stub( :save_object ).and_return( true )        
        Size.stub( :new ).with( "name" => @size.name ).and_return( @size )
        xhr :post, :create, :size => { :name => @size.name }
#        flash.should_receive("now[:notice]")
        assigns[ :object ].should equal( @size )
        response.should render_template( "shared/create_or_update.rjs" )
#        flash.now[:notice].should == 'Размер одежды создан удачно.'
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved size as @object and re-renders new/edit template" do
#        Size.stub(:new_render).and_return({ :template => "shared/new_or_edit.rjs" })
        @size.stub( :save_object ).and_return( false )
        Size.stub( :new ).with( "name" => @size.name ).and_return( @size )
        xhr :post, :create, :size => { :name => @size.name }
        assigns[ :object ].should equal( @size )
        response.should render_template( "shared/new_or_edit.rjs" )               
      end
    end

  end

  describe "PUT update" do
    it "updates the requested size" do
       Size.should_receive( :find ).with( "37" ).and_return( @size )
       @size.should_receive( :update_object ).with( { "size" => { "name" => "Test" }, "action" => "update",
                              "id" => "37", "controller" => "sizes" }, {} )       
       xhr :put, :update, :id => "37", :size => { :name => "Test" }
    end

    context "with valid params" do
      it "assigns the requested size as @object and renders create/update template" do
        @size.stub( :update_object ).and_return( true )
        Size.stub( :find ).and_return( @size )
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @size )
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns the size as @object and re-renders new/edit template" do
        @size.stub( :update_object ).and_return( false )
        Size.stub( :find ).and_return( @size )
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @size )
        response.should render_template( "shared/new_or_edit.rjs" )          
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested size and renders destroy template" do
#      Size.stub(:destroy_render).and_return({ :template => "shared/destroy.rjs" })
      Size.should_receive( :find ).with( "37" ).and_return( @size )
      @size.should_receive( :destroy )
      xhr :delete, :destroy, :id => "37"
      assigns[ :object ].should equal( @size )
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
