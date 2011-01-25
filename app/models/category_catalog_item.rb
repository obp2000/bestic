# encoding: utf-8
class CategoryCatalogItem < CatalogItem
  self.abstract_class = true  

  extend CategorySeasonCatalogItems 
  
end
