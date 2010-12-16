module IndexBlock
  
  def index2( page )
    page.action :replace_html, first.class.index_tag,  :partial => first.class.index_partial, :locals => { :objects => self }
  end  
  
end