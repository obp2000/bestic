require 'spec_helper'
  
class ForumPost; end  
  
describe ForumPostsController do
  
  before(:each) do
#    controller.stub(:current_user).and_return( users_proxy.first )
    @object = forum_posts_proxy.first
    @reply_post = forum_posts_proxy.first
    @reply_post.stub( :parent_id ).and_return( @object.id )
  end
  
  it_should_behave_like "object"  

  it_should_behave_like "show index page title"    
  
  describe "GET reply" do
    it "assigns a new forum post as @object and renders reply template" do
      @object.class.should_receive( :new ).with( :parent_id => @object.to_param ).and_return( @object )      
      xhr :get, :reply, :id => @object.to_param
      assigns[ :object ].should equal( @object )
      response.should render_template( "shared/reply.rjs" )           
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested forum posts chain and renders destroy template" do
      @object.class.should_receive( :destroy_object ).and_return( [ @object, @reply_post ] )
#      @object.class.should_receive( :destroy_render ).and_return( :template => "shared/destroy.rjs" )            
      xhr :delete, :destroy, :id => @object.to_param
      assigns[ :object ].should == [ @object, @reply_post ]
      response.should render_template( "shared/destroy.rjs" )
    end
  end

end
