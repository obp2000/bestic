module SharedHelper
  
  def  link_to_close_window( class_const )
    link_to_function image_tag( *class_const.close_window_image_with_title ) do |page|
      page.action :remove, class_const.index_tag
#      act = lambda { |tag| action :remove, tag }
#      act.bind( page )[ object.class.index_tag ]
    end
  end
  
end
