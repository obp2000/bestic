module SharedHelper
  
  def  link_to_close_window( object )
    link_to_function image_tag( *object.class.close_window_image_with_title ) do |page|
      page.action :remove, object.class.list_tag
#      act = lambda { |tag| action :remove, tag }
#      act.bind( page )[ object.class.list_tag ]
    end
  end
  
end
