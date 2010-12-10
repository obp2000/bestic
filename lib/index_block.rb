module IndexBlock
  
  def index_block
    lambda do |page|
      page.action :replace_html, first.class.content,  :partial => first.class.index_partial, :locals => { :objects => self }
    end
  end  
  
end