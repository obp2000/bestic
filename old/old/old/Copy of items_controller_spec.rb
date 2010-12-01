require 'spec_helper'
  
describe ItemsController do
  
  before do
    controller.stub( :current_user ).and_return( users_proxy.first )
#    @items_proxy = items_proxy
    @item = items_proxy.first
  end

  describe "GET index" do
    it "assigns all items as @objects and renders index template" do
      @new_item = Item.new
      Item.should_receive( :all_and_new ).and_return( [ [ @item ], @new_item ] )
      Item.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index , :sort_by => "name"
      assigns[ :objects ].should == [ @item ]
      assigns[ :object ].should == @new_item      
      response.should render_template( "shared/index.rjs" )
    end
  end

  describe "GET show" do
    it "assigns the requested item as @object and renders show template" do
      Item.stub( :find ).with( "37" ).and_return( @item )
      xhr :get, :show, :id => "37"
      assigns[ :object ].should equal( @item )
      response.should render_template( "shared/show.rjs" )        
    end
  end

  describe "GET new" do
    it "assigns a new item as @object and renders new template" do
      Item.should_receive( :new ).and_return( @item )
      xhr :get, :new
      assigns[ :object ].should equal( @item )
      response.should render_template( "shared/new_or_edit.rjs" )           
    end
  end

  describe "GET edit" do
    it "assigns the requested item as @item and renders new template" do
      Item.should_receive( :find ).with( "37" ).and_return( @item )
      get :edit, :id => "37"
      assigns[ :object ].should equal( @item )
      response.should render_template( "shared/new_or_edit.rjs" )            
    end
  end


  describe "POST create" do
    it "creates a new item" do
      Item.should_receive( :new ).with( "name" => @item.name ).and_return( @item )
      @item.should_receive( :save_object )
      xhr :post, :create, :item => { :name => @item.name }
    end

    context "with valid params" do
      it "assigns a newly created item as @object and renders create/update template" do
        @item.stub( :save ).and_return( true )        
        Item.stub( :new ).with( "name" => @item.name ).and_return( @item )
        xhr :post, :create, :item => { :name => @item.name }
        assigns[ :object ].should equal( @item )
        response.should render_template( "shared/create_or_update.rjs" )
#        flash.now[:notice].should == 'Размер одежды создан удачно.'
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved item as @object and re-renders new template" do
        @item.stub( :save_object ).and_return( false )
        Item.stub( :new ).with( "name" => @item.name, "existing_photo_attributes" => {} ).and_return( @item )
        xhr :post, :create, :item => { :name => @item.name, :existing_photo_attributes => {} }
        assigns[:object].should equal( @item )
        response.should render_template( "shared/new_or_edit.rjs" )               
      end
    end

  end

  describe "PUT update" do
    it "updates the requested item" do
       Item.should_receive( :find ).with( "37" ).and_return( @item )
#       @item_proxy.should_receive( :update_attributes ).with("name" => "Sweater", "existing_photo_attributes" => {})
       @item.should_receive( :update_object ).with( { "item" => { "name" => "Test", "existing_photo_attributes" => {} },
                              "action" => "update", "id" => "37", "controller" => "items" }, {} )        
       xhr :put, :update, :id => "37", :item => { :name => "Test", :existing_photo_attributes => {} }
    end

    context "with valid params" do
      it "assigns the requested item as @object and renders create/update template" do
#        @item.stub( :update_attributes).and_return(true)
        @item.stub( :update_object ).and_return( true )          
        Item.stub( :find ).and_return( @item )
        xhr :put, :update, :id => "1", :item => { :existing_photo_attributes => {} }
        assigns[ :object ].should equal( @item )
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns the item as @object and re-renders new template" do
#        @item_proxy.stub(:update_attributes).and_return(false)
        @item.stub( :update_object ).and_return( false )          
        Item.stub( :find ).and_return( @item )
        xhr :put, :update, :id => "1", :item => { :existing_photo_attributes => {} }
        assigns[ :object ].should equal( @item )
        response.should render_template( "shared/new_or_edit.rjs" )          
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested item and renders destroy template" do
      Item.should_receive( :find ).with( "37" ).and_return( @item )
      @item.should_receive( :destroy )
      xhr :delete, :destroy, :id => "37"
      assigns[ :object ].should equal( @item )
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
