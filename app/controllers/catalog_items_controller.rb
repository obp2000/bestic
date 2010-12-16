class CatalogItemsController < ApplicationController

  def search
    @objects = controller_name.classify.constantize.search_results( params )
    page_title
    render_block_call    
  end

end
