# coding: utf-8

class Category < ItemAttribute
  has_many :items, :include => [:sizes, :colours, :photos]
  has_many :catalog_items, :include => [:sizes, :colours, :photos]
  has_many :summer_catalog_items, :include => [:sizes, :colours, :photos]
  has_many :winter_catalog_items, :include => [:sizes, :colours, :photos]

  self.class_name_rus = "вид одежды"  
  self.class_name_rus_cap = "Вид одежды"
  self.change_image = "color_line.png"
  self.index_text = "Вид одежды"
  self.paginate_options = { :order => 'name' }
  self.attr_partial = "category"     
 
  class << self

    def all_objects( * ); all paginate_options end
      
    def all_of( season_class ); all.reject { |category| category.send( season_class.name.tableize ).empty? } end
      
  end

  def add_to_item1( page )
    page.action :replace_html, "form_#{self.class.index_tag}", :partial => "items/#{self.class.name.underscore}",
              :object => self                      
  end
   
end
