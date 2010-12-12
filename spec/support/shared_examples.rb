shared_examples_for "a template that renders the items/form partial" do
  it "renders the items/form partial" do
    template.should_receive(:render).with( :partial => "category", :object => assigns[:object].category )
    template.should_receive(:render).with( :partial => "attr", :collection => assigns[:object].sizes )
    template.should_receive(:render).with( :partial => "attr", :collection => assigns[:object].colours )
    template.should_receive(:render).with( :partial => "photo", :collection => assigns[:object].photos )      
    render
    response.should have_text_field( assigns[:object], "name" )
    response.should have_text_field( assigns[:object], "price" )    
    response.should have_link_to_remote_get( categories_path )    
    response.should have_selector( "input#item_type_summercatalogitem", :type => "radio",
            :name => "item[type]", :value => "SummerCatalogItem" )
#    response.should have_selector( "img", :src => "/images/" + SummerCatalogItem.icon )            
    response.should have_selector( "input#item_type_wintercatalogitem", :type => "radio",
            :name => "item[type]", :value => "WinterCatalogItem" )              
    response.should have_link_to_remote_get( sizes_path )   
    response.should have_link_to_remote_get( colours_path )    
    response.should have_link_to_remote_get( photos_path )
    response.should have_textarea( assigns[:object], "blurb" )      
    response.should contain( assigns[:object].created_at.strftime("%d.%m.%y") )
    response.should contain( assigns[:object].created_at.strftime("%H:%M:%S") )        
    response.should contain( assigns[:object].updated_at.strftime("%d.%m.%y") )
    response.should contain( assigns[:object].updated_at.strftime("%H:%M:%S") )       
    response.should have_selector( "input", :type => "image" )      
  end
end

shared_examples_for "GET index" do
  it "assigns all objects as @objects, new object as @object and renders index template" do
      Colour.should_receive(:paginate).and_return([@colour_proxy])
      Colour.should_receive(:new).and_return(@colour_proxy)      
      xhr :get, :index
      assigns[:objects].should == [@colour_proxy]
      assigns[:object].should == @colour_proxy
      response.should render_template("shared/index.rjs")      
  end
end

shared_examples_for "new cart item with size_id == 0" do
  it "adds new cart item" do
    @cart_item, success = CartItem.update_object( @params, @session )
    @session.cart.cart_items.should include( @cart_item )
    @cart_item.amount.should == 1
    @cart_item.size_id.should == 0        
  end  
end

shared_examples_for "new cart item with size_id == single size_id" do
  it "adds new cart item" do
    @cart_item, success = CartItem.update_object( @params, @session )
    @session.cart.cart_items.should include( @cart_item )
    @cart_item.amount.should == 1
    @cart_item.size_id.should == @size.id        
  end  
end

shared_examples_for "when catalog item has one or some sizes" do
      context "when catalog item has some sizes" do
        it_should_behave_like "new cart item with size_id == 0"        
      end
      context "when catalog item has only one size" do
        before do
          @size = sizes_proxy.first           
        end
        it_should_behave_like "new cart item with size_id == single size_id"         
      end
end

shared_examples_for "edit and new forms" do

  it "renders a form for edit object" do
#    template.should_receive( :link_to_delete ).with( @object )
    template.should_receive( :link_to_add_to_item ).with( @object )    
    render :locals => { @object.class.name.underscore.to_sym => @object }
    response.should have_selector("form", :method => "post", :action => send( "#{@object.class.name.underscore}_path", @object ) ) do |form|
      form.should have_text_field( @object, "name" )
      form.should have_image_input         
    end
    response.should have_text( regexp_for_remote_delete( send( "#{@object.class.name.underscore}_path", @object ) ) )        
  end

  it "renders a form for a new object" do
    @object = @object.as_new_record
    render :locals => { @object.class.name.underscore.to_sym => @object }
    response.should have_selector("form", :method => "post", :action => send( "#{@object.class.name.tableize}_path")) do |form|
      form.should have_text_field( @object, "name" )
      form.should have_image_input          
    end
  end

end

shared_examples_for "form for more then one" do
  it "renders form for attr" do
    template.should_receive( :render_all_of_attr ).with( @attr, @catalog_item )
    @catalog_item.send( @attr.tableize ).size.should == 2
    template.should_receive( :render_any_of_attr ).with( @attr )    
    render :locals => { :attr => @attr, :catalog_item => @catalog_item }
#    response.should have_radio_button( @catalog_item.send( @attr.tableize ).first )
  end
end

shared_examples_for "form for only one" do
  it "renders form for attr" do
    template.should_receive(:render).with( :partial => "catalog_items/attr1", :collection => @catalog_item.send( @attr.tableize ),
                  :locals => { :checked => true, :visibility => "hidden" } )
    render :locals => { :attr => @attr, :catalog_item => @catalog_item }
  end
end

def create_cart_item
  @session = {}
  @item = Item.create!( valid_item_attributes )
  @params = { :id => "catalog_item_" + @item.id.to_s,
            :blurb => @item.blurb,
            :category_id => @item.category_id,
            :type => @item.type }
  @cart_item, @success = CartItem.update_object( @params, @session )
end

def create_4_catalog_items_with_different_categories_and_seasons
  @category1 = Category.create!( valid_category_attributes )
  @size1 = Size.create!( valid_size_attributes )
  @colour1 = Colour.create!( valid_colour_attributes )  
  @category2 = Category.create!( valid_category_attributes2 )
  @size2 = Size.create!( valid_size_attributes2 )  
  @colour2 = Colour.create!( valid_colour_attributes2 )  
  
  @catalog_item = CatalogItem.create!( valid_item_attributes )
  @catalog_item.type = "SummerCatalogItem"
  @catalog_item.category = @category1
  @catalog_item.sizes = [ @size1 ]
  @catalog_item.colours = [ @colour1 ]  
  @catalog_item.save
  
  @catalog_item = CatalogItem.create!( valid_item_attributes )
  @catalog_item.type = "WinterCatalogItem"
  @catalog_item.category = @category1
  @catalog_item.sizes = [ @size2 ]
  @catalog_item.colours = [ @colour2 ]    
  @catalog_item.save
 
  @catalog_item = CatalogItem.create!( valid_item_attributes )
  @catalog_item.type = "SummerCatalogItem"
  @catalog_item.category = @category2
  @catalog_item.sizes = [ @size1 ]
  @catalog_item.colours = [ @colour1 ]    
  @catalog_item.save
  
  @catalog_item = CatalogItem.create!( valid_item_attributes )
  @catalog_item.type = "WinterCatalogItem"
  @catalog_item.name = "Jacket"  
  @catalog_item.price = "300"
  @catalog_item.category = @category2
  @catalog_item.sizes = [ @size2 ]
  @catalog_item.colours = [ @colour2 ]    
  @catalog_item.save 
  
end

def create_category
  @category = Category.new_object( @params, @session )
  @category.save_object( @session )  
end

def create_colour
  @colour = Colour.new_object( @params, @session )
  @colour.save_object( @session )
end

def create_photo
  @photo = Photo.new_object( @params, @session )
  @photo.save_object( @session )
end

def create_size
  @size = Size.new_object( @params, @session )
  @size.save_object( @session )
end

def create_item
  @item = Item.new_object( @params, @session )
  @item.save_object( @session )  
end

def create_forum_post
  @forum_post = ForumPost.new_object( @params, @session )
  @forum_post.save_object( @session )  
end

shared_examples_for "object" do

  before do
    controller.stub(:current_user).and_return( users_proxy.first )
  end

  describe "GET index" do
    it "assigns all objects as @objects, new object as @object and renders index template" do
      @object.class.should_receive( :all_objects ).and_return( [ @object ] )
#      @object.class.should_receive( :new_object ).and_return( @object.class.new )      
      xhr :get, :index
      assigns[:objects].should == [ @object ]
#      assigns[:object].should == @object.class.new
      response.should render_template( "shared/index.rjs" )
    end
  end

  describe "GET show" do
    it "assigns the requested object as @object and renders show template" do
      @object.class.should_receive( :find ).with( @object.to_param ).and_return( @object )
      xhr :get, :show, :id => @object.to_param
      assigns[ :object ].should equal( @object )
      response.should render_template( "shared/show.rjs" )        
    end
  end

  describe "GET new" do
    it "assigns a new object as @object and renders new template" do
      @object.class.should_receive( :new ).and_return( @object )
      xhr :get, :new
      assigns[ :object ].should equal( @object )
      response.should render_template( "shared/new_or_edit.rjs" )           
    end
  end

  describe "GET edit" do
    it "assigns the requested object as @object and renders new template" do
      @object.class.should_receive( :find ).with( @object.to_param ).and_return( @object )
      get :edit, :id => @object.to_param
      assigns[ :object ].should equal( @object )
      response.should render_template( "shared/new_or_edit.rjs" )            
    end
  end

  describe "POST create" do
    it "creates a new object" do
      @object.class.should_receive( :new_object ).with( { @object.class.name.underscore => { "name"=>@object.name },
                        "action" => "create", "controller" => @object.class.name.tableize }, {} ).and_return( @object )
      @object.should_receive( :save_object )
      xhr :post, :create, @object.class.name.underscore => { :name => @object.name }
    end

    context "with valid params" do
      it "assigns a newly created object as @object and renders create/update template" do
        @object.class.should_receive( :new_object ).and_return( @object )
        @object.stub( :save_object ).and_return( true )        
        xhr :post, :create, @object.class.name.underscore => { "name" => @object.name }
#        flash.should_receive("now[:notice]")
        assigns[ :object ].should equal( @object )
        response.should render_template( "shared/create_or_update.rjs" )
#        flash.now[:notice].should == 'Размер одежды создан удачно.'
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved object as @object and re-renders new/edit template" do
        @object.class.should_receive( :new_object ).and_return( @object )
        @object.stub( :save_object ).and_return(false)
        xhr :post, :create, @object.class.name.underscore => { "name" => @object.name }
        assigns[ :object ].should equal( @object )
        response.should render_template( "shared/new_or_edit.rjs" )               
      end
    end

  end

  describe "PUT update" do
    it "updates the requested object" do
      @object.class.should_receive( :update_object ).with( { @object.class.name.underscore => { "name" => "Test" }, "action" => "update",
                              "id" => @object.to_param, "controller" => @object.class.name.tableize }, {} )
      xhr :put, :update, :id => @object.to_param, @object.class.name.underscore => { "name" => "Test" }
    end

    context "with valid params" do
      it "assigns the requested object as @object and renders create/update template" do
        @object.class.stub( :update_object ).and_return( [ @object, true ] )
        xhr :put, :update, :id => @object.to_param
        assigns[ :object ].should == @object
        response.should render_template( "shared/create_or_update.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns the object as @object and re-renders new/edit template" do
        @object.class.stub( :update_object ).and_return( [ @object, false ] )
        xhr :put, :update, :id => @object.to_param
        assigns[ :object ].should equal( @object )
        response.should render_template( "shared/new_or_edit.rjs" )          
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested object and renders destroy template" do
      @object.class.should_receive( :destroy_object ).with( { "action" => "destroy", "id"=>@object.to_param,
                          "controller" => @object.class.name.tableize }, {} ).and_return( @object )
      xhr :delete, :destroy, :id => @object.to_param
      assigns[ :object ].should equal( @object )
      response.should render_template( "shared/destroy.rjs" )
    end
  end  
    
end

shared_examples_for "show index page title" do

  describe "GET index" do
    it "renders index page title" do
      @object.class.should_receive( :index_page_title ).and_return( "Test" )
      xhr :get, :index
      assigns[ :page_title ].should == "Test"        
    end
  end

end
