module IndexBlock
  
  def index1( page, objects )
    page.replace_index_partial index_tag, index_partial, objects    
  end  
  
end