require 'spec_helper'

describe "forum_posts/_show" do

  before do
    assigns[:object] = forum_posts_proxy.first
  end
  
  it "renders forum post details" do
    render
    response.should contain( assigns[:object].subject )      
    response.should contain( assigns[:object].name )
    response.should contain(assigns[:object].body)
    response.should have_link_to_remote_get( reply_forum_post_path( assigns[:object] ) )    
  end

end
