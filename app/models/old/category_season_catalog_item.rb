class CategorySeasonCatalogItem < CatalogItem

  belongs_to :season
  belongs_to :category

  class << self  

    def catalog_items( params )
      season, @season_name =  Season.find_and_name_for_title( params )
      @category_name = Category.name_for_title( params )
      season.catalog_items_with( params[:category_id] )
    end
    
  end

end
