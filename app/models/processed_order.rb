# coding: utf-8
class ProcessedOrder < Order

#  validates_size_of :order_items, :minimum => 1 
#  validates_length_of :ship_to_first_name, :in => 2..255 
#  validates_length_of :phone_number, :in => 7..20 
#  validates_length_of :customer_ip, :in => 7..15 
#  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
#  validates_inclusion_of :status, :in => [ 'open', 'processed', 'closed', 'failed', 'failed 1', 'failed 2' ] 

  STATUS = "ProcessedOrder"
  STATUS_RUS = "для исп."
  STATUS_RUS_NAV = " со статусом \"для исполнения\"" 

  def validate
    errors.add_to_base "#{self.class.ship_to_first_name_rus} слишком короткое (минимум 2 буквы)" if ship_to_first_name.size < 2  
     
    errors.add_to_base "Номер телефона слишком короткий (минимум 7 цифр)" if phone_number.size < 7  
    
    errors.add_to_base "Неверный формат адреса электронной почты" unless email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i  
   
    errors.add_to_base "Проверочный код неверен" unless captcha_validated
   
    errors.add_to_base "#{Cart.class_name_rus_cap} пустая" unless cart.cart_items.size > 0

  end  
  
  class << self
    
    def class_name_rus_cap; "Заказ для исполнения"; end        
    
    def close_object( params, session )
      ( object = find params[:id] ).close
      object      
    end
       
    def close_render_block; lambda { render :template => "shared/close.rjs" }; end 
      
    def new_page_title; "Оформление #{class_name_rus}а"; end  
  
    def new_image; "tick_16.png"; end
 
    def new_text; "Оформить #{class_name_rus}"; end      

    def close_image; "page_table_close.png"; end

    def close_title; "Закрыть #{class_name_rus}"; end
    
    def close_confirm; "Закрыть #{class_name_rus}?"; end
      
    def captcha_text; "Введите, пожалуйста, проверочный код:"; end
    
    def submit_text; "Разместить #{class_name_rus}"; end
      
    def duration_fade; 20; end
      
    def submit_image_with_options
      [ "submit_tag", submit_text, { :onclick => "$(this).fadeOut().fadeIn()" } ]
    end      

# for "shared/new_or_edit.rjs"      
    def new_or_edit_partial; "new"; end
    def replace; :replace_html; end
      
# for "shared/create_or_update.rjs"
    def create_or_update_partial; new_or_edit_partial; end
      
  end

#  include Action1

  def new_or_edit1( page )
    super page
    page.new_processed_order
#    page.delay( DURATION ) { page.check_cart_links }    
  end

  def create_or_update1( page, session )
    page.create_processed_order self.class.duration_fade
#    page.delay( self.class.duration_fade ) { page.redirect_to "/" }
  end  
  
  def save_object( session )
    self.captcha_validated = session[:captcha_validated]
    self.cart = session.cart
    save && populate_order( self.cart ) && self.cart.clear_cart && OrderNotice.deliver_order_notice( self )
  end     

  def populate_order( cart )
    cart.cart_items.each { |cart_item| order_items.build( cart_item.populate_order_item_hash ) }
    save
  end
  
  def close 
    self.status = ClosedOrder::STATUS
    save( false )
  end
  
  def closed?; false; end

  def close_notice; "#{self.class.class_name_rus_cap} № #{id} успешно закрыт."; end

# for "shared/new_or_edit.rjs"
  def new_or_edit_tag; "content"; end    
    
# for "shared/create_or_update.rjs"
  def create_or_update_tag; new_or_edit_tag; end
  def duration; 20; end
      
end
