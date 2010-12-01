module ItemsHelper

  def link_to_remove_photo_from_item
    link_to_function image_tag( *Photo.delete_from_item_image_with_title ), Photo.delete_from_item_js_string
  end

  def link_to_change( class_const )
    link_to_remote image_tag( *class_const.change_image_with_title ),
                :url => send( class_const.name.tableize + "_path" ), :method => :get
  end
 
end
