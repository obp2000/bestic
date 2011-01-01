require 'spec_helper'

describe "forum_posts/_index" do

  before(:each) do
    assigns[:objects] = forum_posts_proxy
#    template.stub(:will_paginate)
  end
  
  it "renders only one existing forum post" do
#    template.should_receive( :page_title )
    template.should_receive( :index_page_title_for ).with( ForumPost )      
    template.should_receive(:render).with( :partial => "forum_post", :collection => assigns[:objects] )
    template.should_receive( :will_paginate ).with( assigns[:objects] )     
    render
    response.should have_link_to_remote_get( new_forum_post_path )    
  end

end
