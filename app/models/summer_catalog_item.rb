class SummerCatalogItem < CatalogItem

  self.season_icon = "gadu.png"
  self.season_name = "Весна/Лето"
  set_inheritance_column "type"     

#    def self.index_page_title
#      ( super ) + ": " + season_name + ( CatalogItem.category1.name rescue "" )
#    end

end
