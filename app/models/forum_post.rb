# coding: utf-8
class ForumPost < ActiveRecord::Base
  acts_as_threaded

#  validates_length_of :name, :within => 2..50
#  validates_length_of :subject, :within => 5..255
#  validates_length_of :body, :within => 5..5000
  
  def validate
    
    errors.add_to_base "Имя слишком короткое (минимум 2 буквы)" if name.size < 2  
   
    errors.add_to_base "#{self.class.subject_rus} слишком короткая (минимум 5 букв)" if subject.size < 5  

    errors.add_to_base "#{self.class.class_name_rus_cap} слишком короткое (минимум 5 букв)" if body.size < 5  

  end
  
  class << self
    
    def class_name_rus; "сообщение"; end  

    def class_name_rus_cap; "Форум"; end  

    def all_objects( params ); paginate( :page => params[:page], :order =>  'root_id desc, lft',  :per_page => 15 ); end

    def reply( params ); new :parent_id => params[:id]; end
    
    def destroy_object( params, session )
      forum_post = find params[:id]
      delete forum_posts = forum_post.full_set      
      forum_posts
    end

    def index_text; "Форум"; end

#    def controller; "forum_posts"; end
  
    def new_image; "document-edit.png"; end
    alias_method :reply_image, :new_image
  
    def index_image; "agt_forum.png"; end
  
    def new_text; "Новая тема"; end

    def reply_text; "Ответить"; end

    def reply_render_block; lambda { render :template => "shared/reply.rjs" }; end      
      
    def submit_image_with_options; [ "submit_tag", submit_text, { :onclick => "$(this).fadeOut().fadeIn()" } ]; end
  
    def submit_text; "Отправить"; end

    def no_forum_posts_text; "В форуме пока ещё нет сообщений. Будьте первым!"; end
    
    def subject_rus; "Тема"; end
  
    def name_rus; "Автор"; end  
  
    def body_rus; class_name_rus_cap; end

# for "shared/index.rjs"  
    def index_partial; "index"; end
    def index_tag; "content"; end
    include IndexBlock
      
# for "shared/show.rjs"
    def fade_tag; "post_new";  end
    def appear_tag; "post"; end
      
# for "shared/new.rjs"
    def new_or_edit_partial; "new"; end
    def replace; :replace_html; end  

  end

  def after_new_or_edit( page )
    page.visual_effect :fade, :post, :duration => DURATION
    page.visual_effect :fade, :link_to_reply, :duration => DURATION
  end  

  def reply1( page )
    reply( page )
    page.delay( DURATION ) do
      after_reply( page ) rescue nil      
    end
  end

  def reply( page )
    page.action self.class.replace, new_or_edit_tag, :partial => self.class.new_or_edit_partial, :object => self
  end 

  def after_reply( page )
    page.visual_effect :fade, :link_to_reply, :duration => DURATION
  end 

  def create_or_update2( page, session )
    place, tag = parent_id == 0 ? [ "top", "posts" ]  : [ "after", parent_tag ]
    page.insert_html place, tag, :partial => self.class.name.underscore, :object => self
    page.visual_effect :fade, :post, :duration => DURATION
    page.visual_effect :fade, :new_forum_post, :duration => DURATION        
  end

  def new_or_edit_tag; "post_new";  end

  def create_notice; root? ? "Новая тема создана" : "#{self.class.class_name_rus_cap} отправлено"; end

#  def new_render; { :action => ( root? ? "new" : "reply" ) }; end
 
  def style; "margin-left: #{depth*20 + 30}px"; end

  def destroy_notice; "Ветвь сообщений удалена"; end

end
