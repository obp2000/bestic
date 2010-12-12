class ItemAttribute < ActiveRecord::Base
  self.abstract_class = true

  def validate
    errors.add_to_base "#{self.class.class_name_rus_cap} не может быть пустым" if name.blank?  
    errors.add_to_base "Такой #{self.class.class_name_rus} уже есть" if new_record? &&
                       ( self.class.find :all, :conditions => { :name => name } ).first     
  end  

   def self.link_to_change_block
    lambda { |page| page.link_to_remote page.image_tag( change_image, :title => change_title ),
          :url => page.send( *self.plural_path ), :method => :get  }
  end
  
  def self.link_to_close_window_block
    lambda do |page|
      page.link_to_function page.image_tag( close_window_image, :title => close_window_title ) do |page1|
        close_window_block.bind( self )[ page1 ]
      end      
    end
  end
 
  def self.close_window_block
    lambda { |page| page.action :remove, index_tag }
  end
 
 
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

  def radio_button_tag_block
    lambda { |page, checked, visibility| page.radio_button_tag "#{self.class.name.underscore}_id", id, checked,
              :style => "visibility: " + visibility }
  end
    
    
end