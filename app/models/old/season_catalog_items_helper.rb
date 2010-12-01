module SeasonCatalogItemsHelper

  def link_to_catalog_items_with_season( season )
    link_to_remote image_tag( season.icon ) + season.name + " (#{season.catalog_items.count})",
          :url => season_catalog_items_path( season ), :method => :get, :complete => "attach_js()" 
  end
  
end