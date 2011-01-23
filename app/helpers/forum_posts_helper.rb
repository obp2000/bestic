# encoding: cp1251
module ForumPostsHelper

  def create_forum_post( insert_args, fade_tags )
    insert_html *insert_args
    fade_tags.each { |tag1| fade tag1 }    
    show_notice
  end

end