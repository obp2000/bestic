# coding: utf-8

class Category < ItemAttribute
  has_many :items, :include => [:sizes, :colours, :photos]
  has_many :catalog_items, :include => [:sizes, :colours, :photos]
  has_many :summer_catalog_items, :include => [:sizes, :colours, :photos]
  has_many :winter_catalog_items, :include => [:sizes, :colours, :photos]
#  has_many [ :items, :catalog_items, :summer_catalog_items, :winter_catalog_items ], :include => [:sizes, :colours, :photos, :carts]      
#  has_many :seasons, :through => :catalog_items, :uniq => true

#  validates_associated :items

#  validates_presence_of :name 
#  validates_presence_of :season_id
#  validates_uniqueness_of :name
  
#  def validate
#    errors.add_to_base "Название вида одежды не может быть пустым" if name.blank?   
#    errors.add_to_base "Такой #{self.class.class_name_rus} уже есть" if new_record? && 
#            ( self.class.find :all, :conditions => { :name => name } ).size > 0     
#  end

#  extend Shared
 
  class << self
    def class_name_rus; "вид одежды"; end  
  
    def class_name_rus_cap; "Вид одежды"; end  

    def all_objects( params ); all( :order => 'name' ); end

    def change_image; "color_line.png"; end

#    def name_for_title( params ); find( params[:category_id] ).name_for_title; end
      
    def all_of( season_class )
      all.reject do |category|
        category.send( season_class.name.tableize ).size == 0
      end
    end
    
    def index_text; "Вид одежды"; end
      
    def sort_attr; "name"; end
      
  end

  def add_to_item1( page )
    page.action :replace_html, "form_#{self.class.index_tag}", :partial => "items/#{self.class.name.underscore}", :object => self                      
  end
   
end
