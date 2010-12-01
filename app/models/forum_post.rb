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

    def class_name_rus_cap; "Сообщение"; end  

    def all_and_new( params ); [ paginate( :page => params[:page], :order =>  'root_id desc, lft',  :per_page => 15 ), nil ]; end

    def reply( params ); new :parent_id => params[:id]; end
    
    def destroy_object( params, session )
      forum_post = find params[:id]
      delete forum_posts = forum_post.full_set      
      forum_posts
    end

    def destroy_notice; "Ветвь сообщений удалена"; end

    def index_page_title; "Форум"; end

    def controller; "forum_posts"; end
  
    def new_image; "document-edit.png"; end
  
    def link_image; "agt_forum.png"; end
  
    def new_text; "Новая тема"; end

    def reply_text; "Ответить"; end
  
    def new_submit_text; "Отправить"; end

    def no_forum_posts_text; "В форуме пока ещё нет сообщений. Будьте первым!"; end
    
    def subject_rus; "Тема"; end
  
    def name_rus; "Автор"; end  
  
    def body_rus; class_name_rus_cap; end
   
    def index_render; { :template => "shared/index.rjs" }; end
    def show_render; { :template => "shared/show.rjs" }; end         
#    def destroy_render; { :template => "shared/show.rjs" }; end        
    def destroy_render; { :template => "shared/destroy.rjs" }; end
#    def new_render; { :template => "shared/new_or_edit.rjs" }; end
#    def reply_render; { :action => "new" }; end  

# for "shared/index.rjs"  
    def partial; "index"; end
    def content; "content"; end
    def insert_html; false; end
      
# for "shared/show.rjs"
    def fade_content; "post_new";  end
    def appear_content; "post"; end      

  end

  def create_notice; root? ? "Новая тема создана" : "#{self.class.class_name_rus_cap} отправлено"; end

  def new_render; { :action => ( root? ? "new" : "reply" ) }; end
 
  def style; "margin-left: #{depth*20 + 30}px"; end

end
