# coding: utf-8
class ForumPost < ActiveRecord1
  acts_as_threaded

  self.class_name_rus = "сообщение"  
  self.class_name_rus_cap = "Форум"
#  self.index_tag = "content"   
  self.index_partial = "index"
#  self.new_or_edit_partial = "new"
  self.replace = :replace_html
  self.fade_tag = "post_new"
  self.appear_tag = "post"  
  self.index_image = "agt_forum.png"  
  self.index_text = "Форум"
  self.new_image = "document-edit.png"
  self.new_text = "Новая тема"
  self.reply_image = new_image
  self.reply_text = "Ответить"
  self.submit_text = "Отправить"
  self.name_rus = "Автор"    

#  validates_length_of :name, :within => 2..50
#  validates_length_of :subject, :within => 5..255
#  validates_length_of :body, :within => 5..5000
  
  def validate
    errors.add_to_base "Имя слишком короткое (минимум 2 буквы)" if name.size < 2  
    errors.add_to_base "#{self.class.subject_rus} слишком короткая (минимум 5 букв)" if subject.size < 5  
    errors.add_to_base "#{self.class.class_name_rus_cap} слишком короткое (минимум 5 букв)" if body.size < 5  
  end
  
  class << self

    def all_objects( params ); paginate( :page => params[:page], :order =>  'root_id desc, lft',  :per_page => 15 ); end

    def reply( params ); new :parent_id => params[:id]; end
    
    def destroy_object( params, session )
      forum_post = find params[:id]
      delete forum_posts = forum_post.full_set      
      forum_posts
    end

    def reply_render_block; lambda { render :template => "shared/reply.rjs" }; end      
      
    def submit_image_with_options; [ "submit_tag", submit_text, { :onclick => "$(this).fadeOut().fadeIn()" } ]; end
  
    def no_forum_posts_text; "В форуме пока ещё нет сообщений. Будьте первым!"; end
    
    def subject_rus; "Тема"; end
    def body_rus; class_name_rus_cap; end

    include Index1

    def new_or_edit_partial; "new"; end

  end

  def new_or_edit1( page )
    super page
    page.fade :post
  end  

  def reply1( page )
    super page    
    page.fade :link_to_reply    
  end 
  
  def create_or_update1( page, session )
    page.create_forum_post parent_id, parent_tag, self.class.name.underscore, self    
  end

  def new_or_edit_tag; "post_new";  end

  def create_notice; root? ? "Новая тема создана" : "#{self.class.class_name_rus_cap} отправлено"; end
 
  def style; "margin-left: #{depth*20 + 30}px"; end

  def destroy_notice; "Ветвь сообщений удалена"; end

end
