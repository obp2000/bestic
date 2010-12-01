require 'spec_helper'
  
describe ForumPostsController do
  
  before(:each) do
    controller.stub(:current_user).and_return( users_proxy.first )
    @forum_post = forum_posts_proxy.first
    @reply_post = forum_posts_proxy.first
    @reply_post.stub( :parent_id ).and_return( @forum_post.id )
  end

  describe "GET index" do
    it "assigns all forum posts as @objects, new forum_post as nil and renders index template" do
#      ForumPost.should_receive( :paginate ).and_return( [ @forum_post ] )
      ForumPost.should_receive( :all_and_new ).and_return( [ [ @forum_post ], nil ] )
      ForumPost.should_receive( :index_render ).and_return( :template => "shared/index.rjs" )        
      xhr :get, :index
      assigns[ :objects ].should == [ @forum_post ]
      assigns[ :object ].should == nil
      response.should render_template( "shared/index.rjs" )      
    end
  end

  describe "GET show" do
    it "assigns the requested forum_post as @object and renders show template" do
      ForumPost.should_receive( :find ).with( @forum_post.to_param ).and_return( @forum_post )
      xhr :get, :show, :id => @forum_post.to_param
      assigns[ :object ].should == @forum_post
      response.should render_template( "shared/show.rjs" )      
    end
  end

  describe "GET new" do
    it "assigns a new forum post as @object and renders new template" do
      ForumPost.should_receive( :new ).and_return( @forum_post )
      xhr :get, :new
      assigns[ :object ].should equal( @forum_post )
      response.should render_template( "new.rjs" )           
    end
  end
  
    describe "GET reply" do
    it "assigns a new forum post as @object and renders reply template" do
      ForumPost.should_receive( :new ).with( :parent_id => "37" ).and_return( @forum_post )      
#      ForumPost.should_receive(:new).and_return(@forum_post_proxy)
      xhr :get, :reply, :id => "37"
      assigns[ :object ].should equal( @forum_post )
      response.should render_template( "reply.rjs" )           
    end
  end

  describe "POST create" do
    it "creates a new forum post" do
      ForumPost.should_receive( :new ).and_return( @forum_post )
      @forum_post.should_receive( :save_object )
      xhr :post, :create, :forum_post => { :subject => "Post" }
    end

    context "with valid params" do
      it "assigns a newly created forum_post as @object and renders create template" do
        @forum_post.stub( :save_object ).and_return( true )        
        ForumPost.stub( :new ).with( "subject" => "Post" ).and_return( @forum_post )
        xhr :post, :create, :forum_post => { :subject => "Post" }
        assigns[ :object ].should equal( @forum_post )
        response.should render_template( "create.rjs" )
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved forum post as @object and re-renders new template" do
        @forum_post.stub( :save_object ).and_return( false )
        ForumPost.stub( :new ).with( "subject" => "Post" ).and_return( @forum_post )
        @forum_post.should_receive( :new_render ).and_return( :action => "new" )
        xhr :post, :create, :forum_post => { :subject => "Post" }
        assigns[ :object ].should equal( @forum_post )
        response.should render_template( "new.rjs" )               
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested forum posts chain and renders destroy template" do
#      ForumPost.should_receive( :find ).with( "37" ).and_return( @forum_post )
#      ForumPost.should_receive( :delete ).with( @forum_post )
      ForumPost.should_receive( :destroy_object ).and_return( [ @forum_post, @reply_post ] )
      xhr :delete, :destroy, :id => "37"
      assigns[ :object ].should == [ @forum_post, @reply_post ]
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
