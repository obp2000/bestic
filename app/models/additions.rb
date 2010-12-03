# encoding: utf-8
 class ActiveRecord::Base

  class << self
    def all_and_new( params ); [ all, new ]; end

    def update_object( params, session )
      success = ( object = find params[:id] ).update_object( params, session )      
      [ object, success ]
    end    

    def destroy_object( params, session )
      ( object = find params[:id] ).destroy
      object
    end     
    
    def new_object( params, session ); new params[ name.underscore ]; end
    
    def back_image; "back1.png"; end

    def back_title; "Назад"; end

    def delete_image; "delete.png"; end
    
    def add_to_item_image; "arrow_large_right.png"; end
    
    def add_to_item_title; "Добавить к товару"; end

    def close_window_image; "close.png"; end

    def close_window_title; "Закрыть окно"; end
 
    def save_image; "document-save-16.png"; end

    def save_title; "Сохранить"; end
  
    def created_at_rus; "Создан"; end  

    def updated_at_rus; "Изменён"; end      

    def attach_yoxview?; false; end       

    def add_to_item_image_with_title; [ add_to_item_image, { :title => add_to_item_title } ]; end

    def change_title; "Изменить #{class_name_rus.pluralize}"; end  

    def close_window_image_with_title; [ close_window_image, { :title => close_window_title } ]; end

    def back_image_with_title; [ back_image, { :title => back_title } ]; end    
 
    def change_image_with_title; [ change_image, { :title => change_title } ]; end
      
    def edit_partial; name.underscore; end
      
    def new_partial; name.underscore; end      
    
# for "shared/new_or_edit.rjs"      
    def new_or_edit_partial; name.underscore; end
    def replace; :replace; end      
  
# for "shared/create_or_update.rjs"  
    def create_or_update_partial; new_or_edit_partial; end
      
  # for "shared/index.rjs"
    def partial; "shared/index"; end
    def content; list_tag; end      
      
    def list_tag; name.tableize; end
      
    def new_tag; "new_#{name.underscore}"; end
      
    def index_block
      lambda do |page, objects|
        page.action :remove, content
        page.insert_html :after, "tabs",  :partial => partial, :locals => { :objects => objects }
        objects.first.class.after_index_block[ page, objects ] rescue nil        
      end
    end
    
    def create_or_update_block
      lambda do |page, object, session|
        page.visual_effect :fade, object.content_for_create_or_update, :duration => DURATION
        page.delay( DURATION ) do      
          page.remove object.content_for_create_or_update
          opts = lambda { [ :bottom, self.class.list_tag, { :object => self, :partial => self.class.create_or_update_partial } ] }
          page.insert_html *opts.bind( object )[]
          object.class.after_create_or_update_block[ page, object, session ] rescue nil
        end
      end
    end

    def destroy_block
      lambda do |page, objects, session|
        objects.each do |object|
          page.action :remove, object.edit_tag      
          page.action :remove, object.tag
        end
        objects.first.class.after_destroy_block[ page, objects, session ] rescue nil        
      end
    end
      
      
    def duration_fade; DURATION; end
      
    def fade_appear_args; [ fade_content, appear_content ]; end

    def appear_fade_args; [ appear_content, fade_content ]; end      
  
  end
  
  def update_object( params, session ); update_attributes( params[self.class.name.underscore] ); end
  
  def save_object( session ); save; end
  
  def delete_title; "Удалить #{self.class.class_name_rus} #{name_or_id}?"; end

  def create_notice; "#{self.class.class_name_rus_cap} создан удачно."; end

  def update_notice; "#{self.class.class_name_rus_cap} удачно обновлён."; end

  def destroy_notice; "#{self.class.class_name_rus_cap} удалён."; end  
  
  def delete_image_with_title; [ self.class.delete_image, { :title => delete_title } ]; end

  def subject_or_name; respond_to?( :subject ) ? subject : name; end
    
  def name_or_id; respond_to?( :name ) ? name : id; end
 
  def item_id_or_id; respond_to?( :item ) ? item.id : id; end
  
############# tags
  def edit_tag; "edit_#{self.class.name.underscore}_#{id}"; end

  def tag; "#{self.class.name.underscore}_#{id}"; end

  def parent_tag; "#{self.class.name.underscore}_#{parent_id}"; end

#####################################

# for "shared/new_or_edit.rjs"
  def content_for_new_or_edit; new_record? ? self.class.new_tag : edit_tag; end

# for "shared/create_or_update.rjs"
  def content_for_create_or_update; content_for_new_or_edit; end
    
  def new_or_edit_args; [ content_for_new_or_edit, { :partial => self.class.new_or_edit_partial, :object => self } ]; end
  
  def add_to_item_args; [ "form_#{self.class.list_tag}", { :partial => "items/attr", :object => self } ]; end

  def create_or_update_insert_html_args; [  :bottom, self.class.list_tag, { :object => self } ]; end

  def create_or_update_replace_args; [ self.class.new_tag, { :object => self.class.new } ]; end

  def create_or_update_replace_form_args
    [ "form_" + self.class.list_tag, { :partial => "items_" + self.class.new_or_edit_partial, :object => self } ]
  end

end

module CategorySeasonCatalogItems
    
  def catalog_items( params ); category( params ).send( current_catalog_items ); end
    
end

#############################################  
class Object
 
  def send_if_respond( action ); send(action) if respond_to?(action); end
  
  def colon; self + ":"; end

  def cart
    if self[:cart_id]
      Cart.find self[:cart_id]
    else
      self[:cart_id] = ( cart1 = Cart.create ).id
      cart1
    end
  end

  def total; inject(0) {|sum, n| n.price * n.amount + sum}; end

end
