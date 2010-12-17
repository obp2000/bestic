module Action1
  
  def new_or_edit1( page )
    page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self 
  end  
  
  def reply1( page )
    page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self    
  end  

  def close1( page )
    page.action :replace_html, status_tag, ClosedOrder::STATUS_RUS
    page.action :replace_html, updated_tag, page.date_time_rus( updated_at )
    page.action :replace_html, "order_processed", ProcessedOrder.count
    page.action :remove, close_tag, :duration => DURATION
    page.show_notice
  end  

  def create_or_update1( page, session )
    page.action :remove, create_or_update_tag, :duration => DURATION      
    page.delay( DURATION ) do      
      page.insert_html :bottom, self.class.name.tableize, :partial => self.class.create_or_update_partial, :object => self 
    end
    page.show_notice( :delay => self.class.duration_fade )    
    page.visual_effect :highlight, create_or_update_tag, :duration => HIGHLIGHT_DURATION
    page.visual_effect :fade, :errorExplanation, :duation => DURATION    
  end  
  
  def destroy1( page, session )
    page.action :remove, edit_tag rescue nil      
    page.action :remove, tag rescue nil
  end  

  def add_to_item1( page )
    page.action :remove, tag      
    page.delay( DURATION ) do
      page.insert_html :bottom, "form_#{self.class.index_tag}", :partial => "items/#{insert_attr}", :object => self
    end
  end   
  
end