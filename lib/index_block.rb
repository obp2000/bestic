module IndexBlock
  
  def index_block
    lambda do |page, objects|
      page.action :replace_html, content,  :partial => partial, :locals => { :objects => objects }
      objects.first.class.after_index_block[ page, objects ] rescue nil       
    end
  end  
  
end