module Action1
  
  def new_or_edit1( page )
    page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self 
  end  
  alias_method reply1, new_or_edit1

  def close1( page )
    page.close1 status_tag, updated_tag, updated_at
  end  

  def create_or_update1( page, session )
    page.create_or_update1 create_or_update_tag, self.class.name.tableize, self.class.create_or_update_partial, self
#    page.action :remove, create_or_update_tag, :duration => DURATION      
#    page.delay( DURATION ) do      
#      page.insert_html :bottom, self.class.name.tableize, :partial => self.class.create_or_update_partial, :object => self 
#    end
#    page.show_notice( :delay => self.class.duration_fade )    
#    page.visual_effect :highlight, create_or_update_tag, :duration => HIGHLIGHT_DURATION
#    page.visual_effect :fade, :errorExplanation, :duation => DURATION    
  end  
  
  def destroy1( page, session )
    page.destroy2 edit_tag, tag
#    page.action :remove, edit_tag rescue nil      
#    page.action :remove, tag rescue nil
  end  

  def add_to_item1( page )
    page.add_to_item1 tag, self.class.index_tag, insert_attr, self 
  end   
  
end