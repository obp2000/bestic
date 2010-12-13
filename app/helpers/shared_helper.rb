module SharedHelper
  
  def  link_to_close_window( class_const )
    class_const.link_to_close_window_block[ self ]
  end
  
end
