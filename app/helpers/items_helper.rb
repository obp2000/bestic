module ItemsHelper

  def link_to_remove_from_item( class_const )
    class_const.link_to_remove_from_item_block[ self ]       
  end

  def link_to_change( class_const )
    class_const.link_to_change_block[ self ]       
  end
 
end
