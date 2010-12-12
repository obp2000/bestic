module SharedHelper
  
  def  link_to_close_window( class_const )
    class_const.link_to_close_window_block[ self ]
#    link_to_function image_tag( *class_const.close_window_image_with_title ) do |page|
#      class_const.close_window_block[ page ]
#    end
  end
  
end
