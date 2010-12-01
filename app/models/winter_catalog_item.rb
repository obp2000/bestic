class WinterCatalogItem < CatalogItem

  set_inheritance_column "type"       
  
  class << self  

    def season_name; "Осень/Зима"; end

    def season_icon; "weather-snow.png"; end
    
  end

end
