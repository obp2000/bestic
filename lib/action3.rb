module Action3

  def create_or_update1( page, session )
    place, tag = parent_id == 0 ? [ "top", "posts" ]  : [ "after", parent_tag ]
    page.insert_html place, tag, :partial => self.class.name.underscore, :object => self
    page.visual_effect :fade, :post, :duration => DURATION
    page.visual_effect :fade, :new_forum_post, :duration => DURATION  
  end  
  
end