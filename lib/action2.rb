module Action2

  def index1( page, objects )
    page.action :remove, index_tag
    page.delay( DURATION ) do
      page.insert_html :after, "tabs",  :partial => index_partial, :locals => { :objects => objects }
    end
  end

  def show1( page )
    page.action :replace_html, appear_tag, :partial => "show"
    page.fade_appear fade_tag, appear_tag      
  end  

end