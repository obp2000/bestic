# encoding: utf-8
 class ActiveRecord1 < ActiveRecord::Base
  self.abstract_class = true   
   
  class_inheritable_accessor :class_name_rus, :class_name_rus_cap, :back_image, :back_title, :delete_image, :delete_title,
    :close_window_image, :close_window_title,
    :submit_image, :submit_title, :submit_text, :created_at_rus, :updated_at_rus,
    :index_partial, :index_image, :index_text,  :replace,
    :fade_tag, :appear_tag, :delete_text, :nav_image, :nav_text, 
    :new_image, :new_text,
    :name_rus, :submit_with_options, :change_text  
#    :image_with_title

#  class_inheritable_array :index_image

  self.class_name_rus = ""
  self.class_name_rus_cap = ""  
  self.back_image = "back1.png"
  self.back_title = "Назад"    
  self.delete_image = "delete.png"
  self.close_window_image = "close.png"
  self.close_window_title = "Закрыть окно"
  self.submit_with_options = [ "image_submit_tag", "document-save-16.png", { :title => "Сохранить" } ]    
  self.created_at_rus = "Создан"  
  self.updated_at_rus = "Изменён"
  self.index_partial = "shared/index"
  self.index_image = []
  self.index_text = ""
  self.replace = :replace     
  self.fade_tag = ""
  self.appear_tag = ""
  self.delete_text = ""
  self.nav_image = []
  self.nav_text = ""
  self.new_image = []
  self.new_text = ""
  self.name_rus = ""
    
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

    def index_render_block; shared_template_render_block( "index" ); end

    def show_render_block; shared_template_render_block( "show" ); end

    def new_render_block; shared_template_render_block( "new_or_edit" ); end
    alias_method :edit_render_block, :new_render_block

    def create_render_block; shared_template_render_block( "create_or_update" ); end
    alias_method :update_render_block, :create_render_block    
    
    def destroy_render_block; shared_template_render_block( "destroy" ); end    
    
    def shared_template_render_block( template ); lambda { render :template => "shared/" + template + ".rjs" }; end
    
    def link_to_back( page ); page.link_to_function1 back_image, back_title, nil, back_block.bind( self ); end
    
    def back_block; lambda { |page| page.fade_appear( appear_tag, fade_tag )  }; end    
    
    def link_to_close_window( page )
      page.link_to_function1 close_window_image, close_window_title, nil, close_window_block.bind( self )      
    end
  
    def close_window_block; lambda { |page| page.action :remove, index_tag }; end
   
    def index_tag; name.tableize; end    

    def new_tag; "new_#{name.underscore}"; end

    def new_partial; name.underscore; end
      
    def edit_partial; name.underscore; end      

    def new_or_edit_partial; name.underscore; end

    def create_or_update_partial; new_or_edit_partial; end
    
    def index1( page, objects )
      page.insert_index_partial index_tag, index_partial, objects      
      page.attach_js( "attach_js" )  
    end      

    def show1( page )
      page.show2 appear_tag, fade_tag      
      page.attach_js( "attach_yoxview" )      
    end     

    def link_to_new( page )
#      image = [ new_image, { :title => ( new_title rescue nil ) } ]
      text = new_text rescue ""
      page.link_to_remote1 [ new_image, { :title => ( new_title rescue nil ) } ], text, new_path, :method => :get,
              :html => { :id => "link_to_new" }
    end

    def link_to_index( page, params )
#      image = [ index_image, { :title => ( index_title rescue nil ) } ]      
      text = ( params[ :sort_by ].classify.constantize.index_text rescue send( params[ :sort_by ] + "_rus" ) ) rescue class_name_rus_cap.pluralize rescue ""
      page.link_to_remote1 [ index_image, { :title => ( index_title rescue nil ) } ], text, plural_path( params ), :method => :get    
    end

    def link_to_season( page )
      page.link_to_remote1 [ season_icon ], season_name + " (#{count})", plural_path, :method => :get 
    end
  
    def plural_path( params = nil ); [ "#{name.tableize}_path", params ]; end   

    def new_path; [ "new_#{name.underscore}_path" ]; end
      
    def submit_to( page ); page.send( *submit_with_options ); end
  
  end

  def link_to_category( page, seasons )
    page.link_to_remote1 nil, name + " (#{send( seasons ).size})", [ "category_#{seasons}_path", self ],
            :html => { :class => "category" }, :method => :get    
  end

  def link_to_show( page )
    ( page.link_to_remote1( ( image_with_title( ( show_image rescue [] ), ( show_title rescue nil ) ) ),
            ( ( self.class.show_text rescue page.html_escape( subject ) ) rescue name rescue "" ),
            single_path, :method => :get ) ) rescue self.class.deleted_notice
  end

  def link_to_delete( page ) 
    page.link_to_remote1 image_with_title( self.class.delete_image, delete_title ), ( self.class.delete_text rescue "" ),
            single_path, :method => :delete, :confirm => delete_title     
  end
  
  def image_with_title( image, title )
    [ image, { :title => title } ]
  end
  
  def single_path; [ "#{self.class.name.underscore}_path", self ]; end
    
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

  def new_or_edit_or_reply1( page )
    page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self
    page.attach_js( "attach_yoxview" )      
  end 
  alias_method :reply1, :new_or_edit_or_reply1
  alias_method :new_or_edit1, :new_or_edit_or_reply1

  def close1( page ); page.close1 status_tag, updated_tag, updated_at; end  

  def create_or_update1( page, session )
    page.create_or_update1 create_or_update_tag, self.class.name.tableize, self.class.create_or_update_partial, self
  end  
  
  def destroy1( page, session ); page.destroy2 edit_tag, tag; end  

  def each; yield self; end

end
