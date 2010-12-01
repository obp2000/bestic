class SummerCatalogItem < CatalogItem

  set_inheritance_column "type"     

  class << self  

    def season_name; "Весна/Лето";  end

    def season_icon; "gadu.png"; end
    
  end

end
