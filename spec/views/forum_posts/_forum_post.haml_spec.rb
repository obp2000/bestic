require 'spec_helper'

describe "forum_posts/_forum_post" do

  before(:each) do
    @forum_post = forum_posts_proxy.first
    template.stub(:current_user).and_return(true)
  end
  
  it "renders forum post" do
    template.should_receive( :link_to_show ).with( @forum_post )      
    template.should_receive( :link_to_delete ).with( @forum_post )    
    render :locals => { :forum_post => @forum_post }
#    response.should have_link_to_remote_get( forum_post_path( @forum_post ) ) do |a|
#      a.should contain( @forum_post.subject )      
#    end
    response.should contain( @forum_post.name )
    response.should contain( @forum_post.created_at.strftime("%d.%m.%y") )
    response.should contain( @forum_post.created_at.strftime("%H:%M:%S") )
  end

end
