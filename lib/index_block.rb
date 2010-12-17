module IndexBlock
  
  def index1( page, objects )
    page.action :replace_html, index_tag,  :partial => index_partial, :locals => { :objects => objects }
  end  
  
end