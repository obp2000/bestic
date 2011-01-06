require 'spec_helper'

describe ForumPost do
  
  before do
    @valid_attributes = valid_forum_post_attributes
    @forum_post = ForumPost.new( @valid_attributes )
    @params = { "forum_post" => valid_forum_post_attributes }      
    @session = {}
    @flash = {}
    @flash.stub( :now ).and_return( @flash )        
  end

  it "is valid with valid attributes" do
    @forum_post.should be_valid
  end

  it "is not valid without a valid name" do
    @forum_post.name = "N"
    @forum_post.should_not be_valid
  end

  it "is not valid without a valid subject" do
    @forum_post.subject = "S"
    @forum_post.should_not be_valid
  end  
  
  it "is not valid without a valid body" do
    @forum_post.body = "B"
    @forum_post.should_not be_valid
  end    

  describe "#new_object" do
  
    it "builds new forum post" do
      @forum_post = ForumPost.new_object( @params, @session )
      @forum_post.name.should == valid_forum_post_attributes[ :name ]
    end
  
  end
 
  describe "#save_object" do
  
    it "saves new forum post" do
      create_forum_post
      @forum_post.reload
      @forum_post.name.should == valid_forum_post_attributes[ :name ]
      @flash.now[ :notice ].should contain( "тема" )
      @flash.now[ :notice ].should contain( "создана" )        
    end
  
  end  

  describe "#reply" do
  
    it "reply to existing forum post" do
      create_forum_post
#      @params[ :parent_id ] = @forum_post.id
      @valid_attributes[ :id ] = @forum_post.id
      @reply_forum_post = ForumPost.reply( @valid_attributes )
#      @reply_forum_post.save_object( @session, @flash )      
      @reply_forum_post.parent_id.should == @forum_post.id
      @flash.now[ :notice ].should contain( "Сообщение" )
      @flash.now[ :notice ].should contain( "отправлено" )        
    end
  
  end  
  
  describe "#destroy_object" do
  
    it "destroys thread of forum posts" do
      create_forum_post
      @reply_params = { "forum_post" => { :name => "Sergey", :subject => "Reply theme", :body => "Reply body", :parent_id => @forum_post.id } }         
      @reply_forum_post = ForumPost.new_object(  @reply_params, @session ) 
      @reply_forum_post.save_object( @session, @flash )
      @params_for_destroy = { :id => @forum_post.id }
      @forum_posts = ForumPost.destroy_object( @params_for_destroy, @session, @flash )
      @forum_posts.size.should == 2
      @forum_posts.should include( @forum_post )
      @forum_posts.should include( @reply_forum_post )
      @flash.now[ :notice ].should contain( "удалена" )          
    end
  
  end

end
