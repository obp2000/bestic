# coding: utf-8
class Category < ActiveRecord::Base
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
  
  def validate
    errors.add_to_base "Название вида одежды не может быть пустым" if name.blank?   
    errors.add_to_base "Такой вид одежды уже есть" if new_record? && (Category.find :all, :conditions => { :name => name }).size > 0     
  end

  extend Shared 
  class << self
    def class_name_rus; "вид одежды"; end  
  
    def class_name_rus_cap; "Вид одежды"; end  

    def all_and_new( params ); [ all( :order => 'name' ), new ]; end

    def change_image; "color_line.png"; end

    def name_for_title( params ); find( params[:category_id] ).name_for_title; end
      
    def all_of( season_class )
      all.reject do |category|
        category.send( season_class.name.tableize ).size == 0
      end
    end
    
    def after_create_or_update_block
      lambda do |page, object, session|
        opts = lambda { [ self.class.new_tag, { :object => self.class.new, :partial => self.class.create_or_update_partial } ] }
        page.replace *opts.bind( object )[]                       
        page.replace object.tag, :partial => "items/" + object.class.new_or_edit_partial, :object => object          
      end
    end    

    def add_to_item_block
      lambda do |page, object|
        opts = lambda { [ :replace_html, "form_#{self.class.list_tag}",
                { :partial => "items/#{self.class.name.underscore}", :object => self } ] }
        page.action *opts.bind( object )[]                      
      end
    end         
      
  end
   
  def name_for_title; ": " + name; end
   
end
