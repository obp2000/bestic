class ItemAttribute < ActiveRecord::Base
  self.abstract_class = true

  def validate
    errors.add_to_base "#{self.class.class_name_rus_cap} не может быть пустым" if name.blank?  
    errors.add_to_base "Такой #{self.class.class_name_rus} уже есть" if new_record? &&
                       ( self.class.find :all, :conditions => { :name => name } ).first     
  end  

  class << self
   
    def link_to_change( page )
#      page.link_to_remote page.image_tag( change_image, :title => change_title ),
#            :url => page.send( *plural_path ), :method => :get
      page.link_to_remote1 [ change_image,  { :title => change_title } ], "", plural_path, :method => :get
    end
 
    def link_to_remove_from_item( page )
#      page.link_to_function page.image_tag( delete_image, { :title => delete_from_item_title } ), delete_from_item_js_string
      page.link_to_function2 delete_image, delete_from_item_title, delete_from_item_js_string
    end

    def delete_from_item_title; "Удалить из товара"; end
 
    def delete_from_item_js_string
      "$(this).prev().remove();$(this).next(':hidden').remove();$(this).next(':checked').remove();$(this).next('textarea').remove();$(this).remove()"
    end
    
  end

  def link_to_add_to_item( page )
#    page.link_to_function page.image_tag( self.class.add_to_item_image, :title => self.class.add_to_item_title ),
#      &add_to_item_block1.bind( self )
    page.link_to_function1 self.class.add_to_item_image, self.class.add_to_item_title, add_to_item_block1.bind( self )
  end 
 
  def add_to_item_block1
    lambda { |page| add_to_item1( page ) }
  end
  
  def insert_attr; "attr"; end
  
  def create_or_update1( page, session )
    super page, session
    page.after_create_or_update_item_attribute self.class.new_tag, self.class.create_or_update_partial,
            tag, self.class.new_or_edit_partial, self
  end  

  def radio_button_tag1( page, checked, visibility )
    page.radio_button_tag "#{self.class.name.underscore}_id", id, checked, :style => "visibility: " + visibility
  end
    
end