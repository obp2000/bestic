module IndexBlock
  
  def index_block
    lambda do |page, objects|
      page.action :replace_html, content,  :partial => partial, :locals => { :objects => objects }
    end
  end  
  
end