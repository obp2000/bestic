class CatalogItemsController < ApplicationController

  def search
    @objects = CatalogItem.search_results( params )
    page_title    
    render CatalogItem.search_render
  end

end
