# encoding: utf-8
 class ActiveRecord1 < ActiveRecord::Base
   
  self.abstract_class = true   

  Index_template_hash = { :template => "shared/index.rjs" }
  Show_template_hash = { :template => "shared/show.rjs" }
  New_or_edit_template_hash = { :template => "shared/new_or_edit.rjs" }
  Create_or_update_template_hash = { :template => "shared/create_or_update.rjs" }
  Destroy_template_hash = { :template => "shared/destroy.rjs" }      
   
  class_inheritable_accessor :class_name_rus, :class_name_rus_cap, :back_image, :back_title, :delete_image, :delete_title,
    :close_window_image, :close_window_title,
    :submit_image, :submit_title, :submit_text, :created_at_rus, :updated_at_rus,
    :index_partial, :index_image, :index_title, :index_text,  :replace,
    :fade_tag, :appear_tag, :delete_text, :nav_image, :nav_text, 
    :new_image, :new_title, :new_text,
    :show_image, :show_title,
    :name_rus, :submit_with_options, :change_text,
    :index_render_block, :show_render_block, :new_render_block, :edit_render_block, :create_render_block,
    :update_render_block, :destroy_render_block

#  class_inheritable_array :index_image

  self.class_name_rus = ""
  self.class_name_rus_cap = ""  
  self.back_image = "back1.png"
  self.back_title = "Назад"    
  self.delete_image = "delete.png"
  self.delete_text = ""
  self.close_window_image = "close.png"
  self.close_window_title = "Закрыть окно"
  self.submit_with_options = [ "image_submit_tag", "document-save-16.png", { :title => "Сохранить" } ]    
  self.created_at_rus = "Создан"  
  self.updated_at_rus = "Изменён"
  self.index_partial = "shared/index"
  self.index_image = []
  self.index_title = ""
  self.index_text = ""
  self.show_image = []
  self.show_title = ""
  self.replace = :replace     
  self.fade_tag = ""
  self.appear_tag = ""
  self.nav_image = []
  self.nav_text = ""
  self.new_image = []
  self.new_title = ""
  self.new_text = ""
  self.name_rus = ""
  self.index_render_block = lambda { render Index_template_hash }
  self.show_render_block = lambda { render Show_template_hash }
  self.new_render_block = lambda { render New_or_edit_template_hash }
  self.edit_render_block = lambda { render New_or_edit_template_hash }   
  self.create_render_block = lambda { render Create_or_update_template_hash }
  self.update_render_block = lambda { render Create_or_update_template_hash }
  self.destroy_render_block = lambda { render Destroy_template_hash }
#  self.create_or_update_partial = new_or_edit_partial

  attr_accessor_with_default( :show_text ) { name }
  attr_accessor_with_default( :delete_title ) { "Удалить #{self.class.class_name_rus} #{name_or_id}?" }
  attr_accessor_with_default( :tag ) { "#{self.class.name.underscore}_#{id}" }
  attr_accessor_with_default( :edit_tag ) { "edit_#{self.class.name.underscore}_#{id}" }
  attr_accessor_with_default( :new_or_edit_tag ) { new_record? ? self.class.new_tag : edit_tag }
  attr_accessor_with_default( :create_or_update_tag ) { new_or_edit_tag }
  attr_accessor_with_default( :single_path ) { [ "#{self.class.name.underscore}_path", self ] }      
  
  class << self

    def all_objects( params, flash ); all; end

    def update_object( params, session, flash )
      [].tap { |result| result[ 1 ] = ( result[ 0 ] = find params[ :id ] ).update_object( params, session, flash ) }
    end    

    def destroy_object( params, session, flash )
      find( params[ :id ] ).destroy.tap { |object| object.destroy_notice( flash ) }
    end     
    
    def new1; new; end
    
    def new_object( params, session ); new params[ name.underscore ]; end
        
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
      page.link_to_remote1 image_with_title( new_image, new_title ), new_text, new_path, :method => :get,
              :html => { :id => "link_to_new" }
    end

    def link_to_index( page, params )
      page.link_to_remote1 image_with_title( index_image, index_title ),
              ( params[ :index_text ] rescue class_name_rus_cap.pluralize ), plural_path( params ), :method => :get    
    end

    def link_to_season( page )
      page.link_to_remote1 [ season_icon ], season_name + " (#{count})", plural_path, :method => :get 
    end
  
    def link_to_logout( page )
      page.link_to1 [], logout_text, logout_path
    end
  
    def logout_path; [ "logout_path" ]; end
  
    def plural_path( params = nil ); [ "#{name.tableize}_path", params ]; end   

    def new_path; [ "new_#{name.underscore}_path" ]; end
      
    def submit_to( page ); page.send( *submit_with_options ); end

    def image_with_title( image, title ); [ image, { :title => title } ]; end  
  
  end

  def link_to_category( page, seasons )
    page.link_to_remote1 [], name + " (#{send( seasons ).size})", [ "category_#{seasons}_path", self ],
            :html => { :class => "category" }, :method => :get    
  end

  def link_to_show( page )
    ( page.link_to_remote1( self.class.image_with_title( show_image, show_title ),
            page.html_escape( show_text ), single_path, :method => :get ) ) rescue self.class.deleted_notice
  end

  def link_to_delete( page ) 
    page.link_to_remote1 self.class.image_with_title( self.class.delete_image, delete_title ), self.class.delete_text,
            single_path, :method => :delete, :confirm => delete_title     
  end
    
  def update_object( params, session, flash )
    update_attributes( params[ self.class.name.underscore ] )
    tap { update_notice( flash ) }
  end
  
  def save_object( session, flash ); save.tap { |success| create_notice( flash ) if success }; end

  def create_notice( flash ); flash.now[ :notice ] = "#{self.class.class_name_rus_cap} создан удачно."; end

  def update_notice( flash ); flash.now[ :notice ] = "#{self.class.class_name_rus_cap} удачно обновлён."; end

  def destroy_notice( flash ); flash.now[ :notice ] = "#{self.class.class_name_rus_cap} удалён."; end  
    
  def name_or_id; respond_to?( :name ) ? name : id; end

  def new_or_edit( page )
    page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self
    page.attach_js( "attach_yoxview" )      
  end 

  def close1( page ); page.close1 status_tag, updated_tag, updated_at; end  

  def create_or_update1( page, session )
    page.create_or_update1 create_or_update_tag, self.class.name.tableize, self.class.create_or_update_partial, self
  end  
  
  def destroy1( page, session ); page.destroy2 edit_tag, tag; end  

  def each; yield self; end

end
