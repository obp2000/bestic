class ItemAttribute < ActiveRecord1
  
  self.abstract_class = true
  
  class_inheritable_accessor :delete_from_item_title, :delete_from_item_js_string, :insert_attr,
    :change_image, :add_to_item_image, :attr_partial
  
  self.delete_from_item_title = "Удалить из #{Item.class_name_rus}а"
  self.delete_from_item_js_string =
    "$(this).prev().remove();$(this).next(':hidden').remove();$(this).next(':checked').remove();$(this).next('textarea').remove();$(this).remove()"
  self.insert_attr = "attr"      
  self.change_image = []
  self.add_to_item_image = [ "arrow_large_right.png", { :title =>"Добавить к #{Item.class_name_rus}у" } ]
  self.attr_partial = "attr"

  attr_accessor_with_default( :options_for_replace_item_attributes ) { [ tag, { :partial => "items/" + 
          self.class.attr_partial, :object => self } ] }
  attr_accessor_with_default( :add_to_item_block1 ) { lambda { |page| add_to_item1( page ) } }

  def validate
    errors.add_to_base "#{self.class.class_name_rus_cap} не может быть пустым" if name.blank?  
    errors.add_to_base "Такой #{self.class.class_name_rus} уже есть" if new_record? &&
                       ( self.class.find :all, :conditions => { :name => name } ).first     
  end  

  class << self
   
    def link_to_change( page )
      page.link_to_remote1 [ change_image,  { :title => "Изменить #{class_name_rus.pluralize}" } ], "",
              plural_path, :method => :get
    end
 
    def link_to_remove_from_item( page )
      page.link_to_function1 [ delete_image, { :title => delete_from_item_title } ], delete_from_item_js_string
    end
    
    def update_attr( item, ids_array )
      item.send( name.tableize ).clear
      ids_array.each do |id1|
        item.send( name.tableize ) << find( id1 ) rescue nil
      end    
    end    
     
    def options_for_replace_new_tag; [ new_tag, { :partial => create_or_update_partial, :object => new1 } ] end
     
  end

  def link_to_add_to_item( page )
    page.link_to_function1 self.class.add_to_item_image, nil, add_to_item_block1.bind( self )
  end 
  
  def add_to_item1( page )
    page.remove_and_insert [ :remove, tag ],
            [ :bottom, "form_#{self.class.index_tag}", { :partial => "items/#{self.class.insert_attr}", :object => self } ]
  end    
  
  def render_create_or_update( page, session )
    super
    [ self.class.options_for_replace_new_tag, options_for_replace_item_attributes ].each do |replace_args|
      page.replace *replace_args rescue nil
    end  
  end  

  def radio_button_tag1( page, checked, visibility )
    page.radio_button_tag "#{self.class.name.underscore}_id", id, checked, :style => "visibility: " + visibility
  end
    
end