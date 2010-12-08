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

    def create_render_block
      lambda { render :template => "shared/create_or_update.rjs" }
    end
    
    def back_image; "back1.png"; end

    def back_title; "Назад"; end

    def delete_image; "delete.png"; end
    
    def add_to_item_image; "arrow_large_right.png"; end
    
    def add_to_item_title; "Добавить к товару"; end

    def close_window_image; "close.png"; end

    def close_window_title; "Закрыть окно"; end
      
    def submit_image_with_options
      [ "image_submit_tag", submit_image, { :title => submit_title } ]
    end    
 
    def submit_image; "document-save-16.png"; end

    def submit_title; "Сохранить"; end
  
    def created_at_rus; "Создан"; end  

    def updated_at_rus; "Изменён"; end      

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
    def content; index_tag; end      
      
    def index_tag; name.tableize; end
      
    def new_tag; "new_#{name.underscore}"; end
      
    def index_block
      lambda do |page|
        page.action :remove, first.class.content
        page.insert_html :after, "tabs",  :partial => first.class.partial, :locals => { :objects => self }
      end
    end
    
    def after_index_block
      lambda do |page|
        page.delay( DURATION ) do
          page.call( "attach_js" )
        end
      end
    end      
     
    def duration_fade; DURATION; end
      
    def fade_appear_args; [ fade_content, appear_content ]; end

    def appear_fade_args; [ appear_content, fade_content ]; end

    def link_to_new_block
      lambda do |helper|
        image = helper.image_tag( *self.new_image_with_title ) rescue ""
        text = new_text rescue ""
        helper.link_to_remote image + text, :url => helper.send( *self.new_path ), :method => :get,
                :html => { :id => "link_to_new" }
      end
    end

    def link_to_index_block
      lambda do |helper, params|
        image = helper.image_tag( *self.index_image_with_title ) rescue ""
        text = ( params[ :sort_by ].classify.constantize.index_text rescue send( params[ :sort_by ] + "_rus" ) ) rescue class_name_rus_cap.pluralize rescue ""
        helper.link_to_remote image + text, :url => helper.send( *self.plural_path( params ) ), :method => :get  
      end
    end

    def link_to_season_block
      lambda do |page|
        page.link_to_remote page.image_tag( season_icon ) + season_name + " (#{count})",
                :url => page.send( *self.plural_path ), :method => :get, :complete => "attach_js()"
      end      
    end

    def index_image_with_title; [ index_image, { :title => ( index_title rescue "" ) } ]; end

    def new_image_with_title; [ new_image, { :title => ( new_title rescue "" ) } ]; end   
  
    def reply_image_with_title; [ reply_image, { :title => ( reply_title rescue "" ) } ]; end  
  
    def show_image_with_title; [ show_image, { :title => ( show_title rescue "" ) } ]; end
      
    def submit_image_with_title; [ submit_image, { :title => ( submit_title rescue "" ) } ]; end
  
    def plural_path( params = nil ); [ "#{name.tableize}_path", params ]; end   

    def new_path; [ "new_#{name.underscore}_path" ]; end   
  
  end

  def add_to_item_block
    lambda do |page|
      page.remove tag
      page.insert_html :bottom, "form_#{self.class.index_tag}", { :partial => "items/attr", :object => self }
    end
  end

  def show_block
    lambda do |page|
      page.action :replace_html, self.class.appear_content, :partial => "show"
      page.fade_appear *self.class.fade_appear_args      
    end
  end

  def after_show_block
    lambda do |page|
      page.call( "attach_yoxview" )     
    end
  end

  def new_or_edit_block
    lambda do |page|
      page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self 
    end
  end  

  def create_or_update_block
    lambda do |page, session|
      page.visual_effect :fade, create_or_update_tag, :duration => DURATION
      page.delay( DURATION ) do      
        page.remove create_or_update_tag
        page.insert_html :bottom, self.class.index_tag, :partial => self.class.create_or_update_partial, :object => self 
      end
    end
  end

  def after_create_or_update_block
    lambda do |page, session|
      page.insert_html :bottom, self.class.index_tag, :partial => self.class.create_or_update_partial, :object => self
    end
  end

  def destroy_block
    lambda do |page|
      page.action :remove, edit_tag rescue nil      
      page.action :remove, tag rescue nil
    end
  end

  def link_to_category_block
    lambda do |page, seasons|
      page.link_to_remote name + " (#{send( seasons ).size})", :url => page.send( "category_#{seasons}_path", self ),
              :method => :get, :complete => "attach_js()", :html => { :class => "category" }    
    end      
  end

  def render_attrs_block
    lambda do |page|
      page.render :partial => "shared/#{first.class.name.underscore}", :collection => self,
              :spacer_template => "shared/comma"
    end
  end

  def render_options_block
    lambda do |page|
      page.render :partial => "catalog_items/attr", :collection => self,
              :locals => { :checked => ( first.new_record? || !self.second ),
              :visibility => ( second || first.new_record? ) ? "visible" : "hidden" }
    end
  end

  def link_to_show_block
    lambda do |helper|
      image = helper.image_tag( *self.class.show_image_with_title ) rescue ""
      text = ( self.class.show_text rescue helper.html_escape( subject ) ) rescue name rescue ""
      helper.link_to_remote image + text, :url => helper.send( *self.single_path ), :method => :get rescue self.class.deleted_notice
    end
  end

  def link_to_delete_block 
    lambda do |helper|
      image = helper.image_tag( *self.delete_image_with_title ) rescue ""
      text = self.class.delete_text rescue ""
      helper.link_to_remote image + text, :url => helper.send( *self.single_path ), :method => :delete, :confirm => delete_title 
    end
  end

  def link_to_close_block 
    lambda do |helper|
      image = helper.image_tag( *self.close_image_with_title ) rescue ""
      text = self.class.close_text rescue ""
      helper.link_to_remote image + text, :url => helper.send( *self.close_path ), :method => :get,
          :html => { :id => close_tag }, :confirm => self.class.close_confirm
      end
  end    

  def link_to_reply_block 
    lambda do |helper|
      image = helper.image_tag( *self.class.reply_image_with_title ) rescue ""
      text = self.class.reply_text rescue ""    
      helper.link_to_remote image + text, :url => helper.send( *self.reply_path ), :method => :get,
          :html => { :id => "link_to_reply" } 
    end
  end  
  
  def single_path; [ "#{self.class.name.underscore}_path", self ]; end

  def close_path; [ "close_#{self.class.name.underscore}_path", self ]; end

  def reply_path; [ "reply_#{self.class.name.underscore}_path", self ]; end       
    
  def delete_image_with_title; [ self.class.delete_image, { :title => ( delete_title rescue "" ) } ]; end    

  def close_image_with_title; [ self.class.close_image, { :title => self.class.close_title } ]; end
    
  def update_object( params, session ); update_attributes( params[self.class.name.underscore] ); end
  
  def save_object( session ); save; end
  
  def delete_title; "Удалить #{self.class.class_name_rus} #{name_or_id}?"; end

  def create_notice; "#{self.class.class_name_rus_cap} создан удачно."; end

  def update_notice; "#{self.class.class_name_rus_cap} удачно обновлён."; end

  def destroy_notice; "#{self.class.class_name_rus_cap} удалён."; end  

  def subject_or_name; respond_to?( :subject ) ? subject : name; end
    
  def name_or_id; respond_to?( :name ) ? name : id; end
 
  def item_id_or_id; respond_to?( :item ) ? item.id : id; end
  
############# tags
  def edit_tag; "edit_#{self.class.name.underscore}_#{id}"; end

  def tag; "#{self.class.name.underscore}_#{id}"; end

  def parent_tag; "#{self.class.name.underscore}_#{parent_id}"; end

#####################################

# for "shared/new_or_edit.rjs"
  def new_or_edit_tag; new_record? ? self.class.new_tag : edit_tag; end

# for "shared/create_or_update.rjs"
  def create_or_update_tag; new_or_edit_tag; end
    
  def new_or_edit_args; [ new_or_edit_tag, { :partial => self.class.new_or_edit_partial, :object => self } ]; end
  
  def add_to_item_args; [ "form_#{self.class.index_tag}", { :partial => "items/attr", :object => self } ]; end

  def create_or_update_insert_html_args; [  :bottom, self.class.index_tag, { :object => self } ]; end

  def create_or_update_replace_args; [ self.class.new_tag, { :object => self.class.new } ]; end

  def create_or_update_replace_form_args
    [ "form_" + self.class.index_tag, { :partial => "items_" + self.class.new_or_edit_partial, :object => self } ]
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
