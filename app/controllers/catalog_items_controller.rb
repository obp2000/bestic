class CatalogItemsController < ApplicationController

  def search
    @objects = controller_name.classify.constantize.search_results( params, flash )
    render_block_call( "index" )    
  end

end
