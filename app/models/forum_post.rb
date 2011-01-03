# coding: utf-8
class ForumPost < ActiveRecord1
  acts_as_threaded

  self.class_name_rus = "сообщение"  
  self.class_name_rus_cap = "Форум"
#  self.index_tag = "content"   
  self.index_partial = "index"
  self.replace = :replace_html
  self.fade_tag = "post_new"
  self.appear_tag = "post"  
  self.index_image = "agt_forum.png"  
  self.index_text = "Форум"
  self.new_image = "document-edit.png"
  self.new_text = "Новая тема"
  self.submit_with_options = [ "submit_tag", "Отправить", { :onclick => "$(this).fadeOut().fadeIn()" } ]
  self.name_rus = "Автор"

  class_inheritable_accessor :new_or_edit_partial, :no_forum_posts_text, :subject_rus, :body_rus, :reply_image,
          :reply_text, :reply_render_block
  self.new_or_edit_partial = "new"
  self.no_forum_posts_text = "В форуме пока ещё нет сообщений. Будьте первым!"
  self.subject_rus = "Тема"
  self.body_rus = "Сообщение"
  self.reply_image = new_image
  self.reply_text = "Ответить"
  self.reply_render_block = lambda { render :template => "shared/reply.rjs" }
  
  attr_accessor_with_default( :show_text ) { subject }
  attr_accessor_with_default( :style ) { "margin-left: #{depth*20 + 30}px" }
  attr_accessor_with_default( :new_or_edit_tag ) { "post_new" }
  attr_accessor_with_default( :parent_tag ) { "#{self.class.name.underscore}_#{parent_id}" }  
  attr_accessor_with_default( :reply_path ) { [ "reply_#{self.class.name.underscore}_path", self ] }  
    
  def validate
    errors.add_to_base "Имя слишком короткое (минимум 2 буквы)" if name.size < 2  
    errors.add_to_base "#{self.class.subject_rus} слишком короткая (минимум 5 букв)" if subject.size < 5  
    errors.add_to_base "#{self.class.class_name_rus_cap} слишком короткое (минимум 5 букв)" if body.size < 5  
  end
  
  class << self

    def all_objects( params, flash ); paginate( :page => params[ :page ], :order =>  'root_id desc, lft',  :per_page => 15 ); end

    def reply( params ); new :parent_id => params[ :id ]; end
    
    def destroy_object( params, session, flash )
      find( params[ :id ] ).full_set.tap { |objects| delete objects; objects.first.destroy_notice( flash ) }
    end

    def index_page_title_for( * ); class_name_rus_cap; end

    include Index1

  end

  def link_to_reply_to( page )
    page.link_to_remote1 [ self.class.reply_image ], self.class.reply_text, reply_path, :method => :get,
            :html => { :id => "link_to_reply" }  
  end

  def new_or_edit( page )
    super page
    page.fade :post
  end  

  def reply( page )
    self.class.superclass.instance_method( :new_or_edit ).bind( self )[ page ]    
    page.fade :link_to_reply    
  end 
  
  def create_or_update1( page, session )
    page.create_forum_post parent_id, parent_tag, self.class.name.underscore, self    
  end

  def create_notice( flash )
    flash.now[ :notice ] = parent_id.zero? ? "Новая тема создана" : "Сообщение отправлено"
  end

  def destroy_notice( flash ); flash.now[ :notice ] = "Ветвь сообщений удалена"; end

end
