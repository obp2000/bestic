module CategorySeasonCatalogItemsHelper
  
  def link_to_catalog_items_with_category_and_season( category, season )
    link_to_remote category.name + " (#{season.catalog_items_with( category ).size})",
          :url => category_season_catalog_items_path( category, season ),
          :method => :get, :complete => "attach_js()", :html => { :class => "category" }  
  end  
  
end