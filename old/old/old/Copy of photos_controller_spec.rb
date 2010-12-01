require 'spec_helper'
  
describe PhotosController do
  
  before(:each) do
    controller.stub(:current_user).and_return( users_proxy.first )
    @photo = photos_proxy.first
  end

  describe "GET index" do
    it "assigns all photos as @objects, new photo as @object and renders index template" do
#      Photo.should_receive( :paginate ).and_return( [ @photo ] )
#      Photo.should_receive( :new ).and_return( @photo )
      Photo.should_receive( :all_and_new ).and_return( [ [ @photo ], @photo ] )
      Photo.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index
      assigns[ :objects ].should == [ @photo ]
      assigns[ :object ].should == @photo
      response.should render_template( "shared/index.rjs" )      
    end
  end

  describe "POST create" do
    it "creates a new photo" do
      Photo.should_receive( :new ).with( "name" => "photo1" ).and_return( @photo )
      @photo.should_receive( :save_object )
      xhr :post, :create, :photo => { :name => "photo1" }
    end

    it "should be able to upload item's photos" do
      image = fixture_path + "/test.jpg"
      file = ActionController::TestUploadedFile.new image, "image/jpeg"
      xhr :post, :create, :photo => { :uploaded_data => file }
      Photo.find( :last, :conditions => { :filename => "test.jpg" } ).filename.should == "test.jpg"
    end

    context "with valid params" do
      it "assigns a newly created photo as @object and renders create/update template" do
        @photo.should_receive( :save_object ).and_return( true )        
        Photo.stub( :new ).with( "name" => "photo1" ).and_return( @photo )
        xhr :post, :create, :photo => { :name => "photo1"}
#        flash.should_receive("now[:notice]")
        assigns[ :object ].should equal( @photo )
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved photo as @object and re-renders new/edit template" do
        @photo.should_receive( :save_object ).and_return( false )
        Photo.stub( :new ).with( "name" => "photo1" ).and_return( @photo )
        xhr :post, :create, :photo => { :name => "photo1" }
        assigns[ :object ].should equal( @photo )
        response.should render_template( "shared/new_or_edit.rjs" )               
      end
    end

  end

  describe "PUT update" do
    it "updates the requested photo comment" do
       Photo.should_receive( :find ).with( "37" ).and_return( @photo )
       @photo.should_receive( :update_object ).with( { "photo" => { "comment" => "Test" },
                              "action" => "update", "id" => "37", "controller" => "photos" }, {} )       
       xhr :put, :update, :id => "37", :photo => { "comment" => "Test" }
    end

    context "with valid params" do
      it "assigns the requested photo as @object and renders create/update template" do
        @photo.stub( :update_object ).and_return( true )                
        Photo.stub( :find ).and_return( @photo )
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @photo )
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns the photo as @object and re-renders new/edit template" do
        @photo.stub( :update_object ).and_return( false )                
        Photo.stub( :find ).and_return( @photo )
        xhr :put, :update, :id => "1"
        assigns[ :object ].should equal( @photo )
        response.should render_template( "shared/new_or_edit.rjs" )          
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested photo and renders destroy template" do
      Photo.should_receive( :find ).with( "37" ).and_return( @photo )
      @photo.should_receive( :destroy )
      xhr :delete, :destroy, :id => "37"
      assigns[ :object ].should equal( @photo )
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
