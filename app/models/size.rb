# coding: utf-8
class Size < ActiveRecord::Base
  has_many :items_sizes, :dependent => :delete_all
  has_many :items, :through => :items_sizes
  
  has_many :cart_items
  has_many :order_items
  
#  validates_uniqueness_of :name
  
  def validate

    errors.add_to_base "#{self.class.class_name_rus_cap} не может быть пустым" if name.blank?  
   
    errors.add_to_base "Такой #{self.class.class_name_rus} уже есть" if new_record? &&
                       ( Size.find :all, :conditions => { :name => name } ).first     
  
  end

  extend Shared 
  class << self
    
    def class_name_rus; "размер одежды"; end

    def class_name_rus_cap; "Размер одежды"; end

    def change_image; "pencil-ruler.png"; end
      
    def index_text; "Размеры"; end      
      
    def after_create_or_update_block
      lambda do |page, object, session|
          opts = lambda { [ self.class.new_tag, { :object => self.class.new, :partial => self.class.create_or_update_partial } ] }
          page.replace *opts.bind( object )[]                       
          page.replace object.tag, :partial => "items/" + object.class.new_or_edit_partial, :object => object          
      end
    end      
  
  end

end
