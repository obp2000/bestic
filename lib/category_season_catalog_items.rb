module CategorySeasonCatalogItems
    
  def catalog_items( params ); Category.find( params[ :category_id ] ).send( current_catalog_items ); end

#  def index_page_title
#    ( super ) + ": " + @category.name
#  end   
   
end