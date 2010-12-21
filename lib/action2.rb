module Action2

  def index1( page, objects )
    page.insert_index_partial index_tag, index_partial, objects
  end

  def show1( page )
    page.show2 appear_tag, fade_tag
  end  

end