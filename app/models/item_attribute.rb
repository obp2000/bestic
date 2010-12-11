class ItemAttribute < ActiveRecord::Base
  self.abstract_class = true

  def validate
    errors.add_to_base "#{self.class.class_name_rus_cap} не может быть пустым" if name.blank?  
    errors.add_to_base "Такой #{self.class.class_name_rus} уже есть" if new_record? &&
                       ( self.class.find :all, :conditions => { :name => name } ).first     
  end  
 
#  extend Shared   
  
  def add_to_item_block
    lambda do |page|
      page.action :remove, tag      
      page.delay( DURATION ) do
        page.insert_html :bottom, "form_#{self.class.index_tag}", :partial => "items/#{insert_attr}", :object => self
      end
    end
  end  
  
  def insert_attr
    "attr"    
  end
  
  def after_create_or_update_block
    lambda do |page, session|
      page.replace self.class.new_tag, :object => self.class.new, :partial => self.class.create_or_update_partial                       
      page.replace tag, :partial => "items/" + self.class.new_or_edit_partial, :object => self
      page.call( js_after_create_or_update ) rescue nil      
    end
  end  
    
end