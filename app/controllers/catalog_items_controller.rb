class CatalogItemsController < ApplicationController

  def search
    @objects = controller_name.classify.constantize.search_results( params )
    page_title
    render_block_call    
#    render CatalogItem.search_render
  end

end
