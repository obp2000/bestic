module ItemAttributesHelper
  
  def add_to_item1( tag, index_tag, insert_attr, object )
    action :remove, tag      
    delay( DURATION ) do
      insert_html :bottom, "form_#{index_tag}", :partial => "items/#{insert_attr}", :object => object
    end    
  end
  
  def after_create_or_update_item_attribute( new_tag, create_or_update_partial, tag, new_or_edit_partial, object )
    replace new_tag, :partial => create_or_update_partial, :object => object.class.new rescue nil                      
    replace tag, :partial => "items/" + new_or_edit_partial, :object => object rescue nil     
  end  
  
end