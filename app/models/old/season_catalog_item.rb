class SeasonCatalogItem < CatalogItem

  belongs_to :season
  belongs_to :category

  class << self
  
    def catalog_items( params )
      season, @season_name = Season.find_and_name_for_title( params )
      season.catalog_items    
    end
  
#    def index_render; super; end
      
  end
  
end
