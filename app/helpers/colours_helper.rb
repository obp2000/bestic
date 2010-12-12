module ColoursHelper
  
  def link_to_add_html_code_to( class_const )
    class_const.link_to_add_html_code_block[ self ]
  end
  
end
