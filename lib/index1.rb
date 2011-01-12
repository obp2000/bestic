module Index1
  
  def render_index( page, objects ); page.replace_index_partial index_tag, index_partial, objects end  
  
  def index_tag; "content" end
  
end