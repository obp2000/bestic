# coding: utf-8
class Season < ActiveRecord::Base
  has_many :items, :include => [:sizes, :colours, :photos, :carts]
  has_many :catalog_items, :include => [:sizes, :colours, :photos, :carts]
  has_many :categories, :through => :catalog_items, :uniq => true

  @@all_id = 100

  class << self

    def class_name_rus; "сезон"; end  

    def class_name_rus_cap; "Сезон"; end  
  
    def find_and_name_for_title( params ); [ season = find( params[:season_id] ), season.name_for_title ]; end  
  
    def all_seasons; find( :all, :conditions => "id != #{@@all_id}" ); end
  
    def season_all; find @@all_id; end  
  
  end
  
  def catalog_items_with_all; id == @@all_id ? CatalogItem : catalog_items_without_all; end
  alias_method_chain :catalog_items, :all
  
  def categories_with_all; id == @@all_id  ? Category : categories_without_all; end
  alias_method_chain :categories, :all

  def name_for_title; ": " + ( self ? self : Season.find( @@all_id ) ).name; end

  def catalog_items_with( category )
    catalog_items.find_all_by_category_id( category )
#    catalog_items.find( :all, :conditions =>  [ "category_id= ? AND id> ?", category.id, 0 ] )
#    categories.find( category ).catalog_items
  end

#  class << self
#    def find_with_nil( id )
#      if id
#        find_without_nil id
#      else
#        nil
#      end
#    end
#    alias_method_chain :find, :nil  
#  end
    
#  def self.all_id
#    100
#  end
 
end
