module ForumPostsHelper
  
#  def create_forum_post( forum_post )
#    opts = lambda do
#      place, content = parent_id == 0 ? [ "top", "posts" ]  : [ "after", parent_tag ]
#      [ place, content, { :partial => self.class.name.underscore, :object => self } ]      
#    end
#    insert_html *opts.bind( forum_post )[]
#    with_options :duration => DURATION do |with_duration|
#      with_duration.visual_effect :fade, :post
#      with_duration.visual_effect :fade, :post_new
#    end
#    show_notice
#  end
  
  def link_to_reply_to( forum_post )
    link_to_remote image_tag(ForumPost.new_image) + ForumPost.reply_text,
          :url => reply_forum_post_path(forum_post), :method => :get, :html => { :id => "reply" }    
  end
  
  def link_to_new_forum_post
    link_to_remote image_tag(ForumPost.new_image) + ForumPost.new_text , :url => new_forum_post_path,
          :html => { :id => "new_post" }, :method => :get
  end

end