# encoding: utf-8
 class ActiveRecord::Base

  extend Action2
  
  class << self

    def all_objects( params ); all; end

    def update_object( params, session )
      success = ( object = find params[:id] ).update_object( params, session )      
      [ object, success ]
    end    

    def destroy_object( params, session )
      ( object = find params[:id] ).destroy
      object
    end     
    
    def new_object( params, session ); new params[ name.underscore ]; end

    def index_render_block
      shared_template_render_block( "index" )      
    end

    def show_render_block
      shared_template_render_block( "show" )           
    end

    def new_render_block
      shared_template_render_block( "new_or_edit" )           
    end
    alias_method :edit_render_block, :new_render_block

    def create_render_block
      shared_template_render_block( "create_or_update" )           
    end
    alias_method :update_render_block, :create_render_block    
    
    def destroy_render_block
      shared_template_render_block( "destroy" )     
    end    
    
    def shared_template_render_block( template )
      lambda { render :template => "shared/" + template + ".rjs" }      
    end
    
    def link_to_back( page )
      page.link_to_function1 back_image, back_title, back_block.bind( self )
    end
    
    def back_block
      lambda { |page| page.fade_appear( appear_tag, fade_tag )  }
    end    
    
    def link_to_close_window( page )
      page.link_to_function1 close_window_image, close_window_title, close_window_block.bind( self )      
    end
    
    def close_window_block
      lambda { |page| page.action :remove, index_tag }
    end       
    
    def back_image; "back1.png"; end

    def back_title; "Назад"; end

    def delete_image; "delete.png"; end
    
    def add_to_item_image; "arrow_large_right.png"; end
    
    def add_to_item_title; "Добавить к товару"; end

    def close_window_image; "close.png"; end

    def close_window_title; "Закрыть окно"; end
      
    def submit_image_with_options; [ "image_submit_tag", submit_image, { :title => submit_title } ]; end    
 
    def submit_image; "document-save-16.png"; end

    def submit_title; "Сохранить"; end
  
    def created_at_rus; "Создан"; end  

    def updated_at_rus; "Изменён"; end      

    def change_title; "Изменить #{class_name_rus.pluralize}"; end  
      
    def edit_partial; name.underscore; end
      
    def new_partial; name.underscore; end      
    
# for "shared/new_or_edit.rjs"      
    def new_or_edit_partial; name.underscore; end
    def replace; :replace; end      
  
# for "shared/create_or_update.rjs"  
    def create_or_update_partial; new_or_edit_partial; end
      
  # for "shared/index.rjs"
    def index_partial; "shared/index"; end
#    def content; index_tag; end      
      
    def index_tag; name.tableize; end
      
    def new_tag; "new_#{name.underscore}"; end
    
    def index1( page, objects )
      super page, objects
      page.attach_js( "attach_js" )  
    end      

    def show1( page )
      super page
      page.attach_js( "attach_yoxview" )      
    end     
         
    def duration_fade; DURATION; end

    def link_to_new( page )
#        image = page.image_tag( new_image, :title => ( new_title rescue "" ) ) rescue ""
      image = [ new_image, { :title => ( new_title rescue nil ) } ] rescue []
      text = new_text rescue ""
#        page.link_to_remote image + text, :url => page.send( *new_path ), :method => :get, :html => { :id => "link_to_new" }
      page.link_to_remote1 image, text, new_path, :method => :get, :html => { :id => "link_to_new" }
    end

    def link_to_index( page, params )
#      image = page.image_tag( index_image, :title => ( index_title rescue "" ) ) rescue ""
      image = [ index_image, { :title => ( index_title rescue nil ) } ] rescue []      
      text = ( params[ :sort_by ].classify.constantize.index_text rescue send( params[ :sort_by ] +
              "_rus" ) ) rescue class_name_rus_cap.pluralize rescue ""
#      page.link_to_remote image + text, :url => page.send( *plural_path( params ) ), :method => :get
      page.link_to_remote1 image, text, plural_path( params ), :method => :get    
    end

    def link_to_season( page )
      page.link_to_remote1 [ season_icon ], season_name + " (#{count})", plural_path, :method => :get 
    end
  
    def plural_path( params = nil ); [ "#{name.tableize}_path", params ]; end   

    def new_path; [ "new_#{name.underscore}_path" ]; end
      
    def submit_to( page )
      page.send( *submit_image_with_options )
    end
  
  end

  include Action1

  def new_or_edit1( page )
    super page
    page.attach_js( "attach_yoxview" )      
  end

  def link_to_category( page, seasons )
    page.link_to_remote1 nil, name + " (#{send( seasons ).size})", [ "category_#{seasons}_path", self ],
            :html => { :class => "category" }, :method => :get    
  end

  def link_to_show( page )
#    image = page.image_tag( show_image, :title => ( show_title rescue "" ) ) rescue ""
    image = [ show_image, { :title => ( show_title rescue "" ) } ] rescue ""
    text = ( self.class.show_text rescue page.html_escape( subject ) ) rescue name rescue ""
#    page.link_to_remote image + text, :url => page.send( *single_path ), :method => :get rescue self.class.deleted_notice
    ( page.link_to_remote1 image, text, single_path, :method => :get ) rescue self.class.deleted_notice
  end

  def link_to_delete( page ) 
#    image = page.image_tag( self.class.delete_image, :title => ( delete_title rescue "" ) ) rescue ""
    image = [ self.class.delete_image, { :title => ( delete_title rescue "" ) } ]    
    text = self.class.delete_text rescue ""
#    page.link_to_remote image + text, :url => page.send( *single_path ), :method => :delete, :confirm => delete_title
    page.link_to_remote1 image, text, single_path, :method => :delete, :confirm => delete_title     
    
  end

  def link_to_close( page )
#    image = page.image_tag( self.class.close_image, :title => self.class.close_title ) rescue ""
    image = [ self.class.close_image, { :title => ( self.class.close_title rescue nil ) } ]    
#    page.link_to_remote image, :url => page.send( *close_path ), :method => :get,
#        :html => { :id => close_tag }, :confirm => self.class.close_confirm
    page.link_to_remote1 image, "", close_path, :method => :get, :html => { :id => close_tag },
            :confirm => self.class.close_confirm
  end    

  def link_to_reply( page )
#    image = page.image_tag(  reply_image, :title => ( reply_title rescue "" ) ) rescue ""
    image = [ self.class.reply_image, { :title => ( self.class.reply_title rescue nil ) } ]    
    text = self.class.reply_text rescue ""    
#    page.link_to_remote image + text, :url => page.send( *reply_path ), :method => :get, :html => { :id => "link_to_reply" }
    page.link_to_remote1 image, text, reply_path, :method => :get, :html => { :id => "link_to_reply" }  
  end
  
  def single_path; [ "#{self.class.name.underscore}_path", self ]; end

  def close_path; [ "close_#{self.class.name.underscore}_path", self ]; end

  def reply_path; [ "reply_#{self.class.name.underscore}_path", self ]; end       
    
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

end

class Object
  
  def colon; self + ":"; end

  def cart
    if self[ :cart_id ]
      Cart.find self[ :cart_id ]
    else
      self[ :cart_id ] = ( cart1 = Cart.create ).id
      cart1
    end
  end

  def total; inject(0) {|sum, n| n.price * n.amount + sum}; end

  def to_array; is_a?( Array ) ? self : self.to_a; end

end
