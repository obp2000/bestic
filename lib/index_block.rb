module IndexBlock
  
  def index_block
    lambda do |page|
      page.action :replace_html, first.class.content,  :partial => first.class.partial, :locals => { :objects => self }
    end
  end  
  
end