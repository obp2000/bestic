module CategorySeasonCatalogItems
    
  def catalog_items( params ); category( params ).send( current_catalog_items ); end
    
end