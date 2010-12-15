module IndexBlock
  
  def index_block
    lambda do |page|
      page.action :replace_html, self.first.class.index_tag,  :partial => self.first.class.index_partial, :locals => { :objects => self }
    end
  end  
  
end