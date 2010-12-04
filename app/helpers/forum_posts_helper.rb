module ForumPostsHelper
  
  def link_to_reply_to( forum_post )
    link_to_remote image_tag(ForumPost.new_image) + ForumPost.reply_text,
          :url => reply_forum_post_path( forum_post ), :method => :get, :html => { :id => "link_to_reply" }    
  end
  
  def link_to_new_forum_post
    link_to_remote image_tag(ForumPost.new_image) + ForumPost.new_text ,
          :url => new_forum_post_path, :method => :get, :html => { :id => "link_to_new" } 
  end

end