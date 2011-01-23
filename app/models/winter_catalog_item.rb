# encoding: cp1251
class WinterCatalogItem < CatalogItem

  self.season_icon = "weather-snow.png"
  self.season_name = "Осень/Зима"
  set_inheritance_column "type"       

end
