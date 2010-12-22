module ForumPostsHelper

  def create_forum_post( parent_id, parent_tag, partial, object )
    place, tag = parent_id == 0 ? [ "top", "posts" ]  : [ "after", parent_tag ]
    insert_html place, tag, :partial => partial, :object => object
    fade :post
    fade :new_forum_post      
  end
  
  def reply1
    delay( DURATION ) { fade_with_duration :link_to_reply }
  end  

end