# coding: utf-8
class ProcessedOrder < Order

  self.class_name_rus_cap = "Заказ для исполнения"
#  self.new_or_edit_partial = "new"
  self.replace = :replace_html
  self.new_image = "tick_16.png"
  self.new_text = "Оформить #{class_name_rus}"   
  self.submit_with_options = [ "submit_tag", "Разместить #{class_name_rus}", { :onclick => "$(this).fadeOut().fadeIn()" } ]
  
  class_inheritable_accessor :close_image, :close_title, :close_confirm, :captcha_text,
    :fade_duration, :new_or_edit_partial, :close_render_block, :new_page_title 

#  self.new_page_title = "Оформление #{class_name_rus}а"
  self.close_image = "page_table_close.png"
  self.close_title = "Закрыть #{class_name_rus}"
  self.close_confirm = "Закрыть #{class_name_rus}?"
  self.captcha_text = "Введите, пожалуйста, проверочный код:"
  self.fade_duration = 20
  self.new_or_edit_partial = "new"
  self.close_render_block = lambda { render :template => "shared/close.rjs" }
  self.status_eng = "ProcessedOrder"
  self.status_rus_nav = " со статусом \"для исполнения\""
  self.status_rus = "для исп."
  self.new_page_title = "Оформление #{class_name_rus}а"  

  attr_accessor_with_default( :new_or_edit_tag ) { "content" }
#  attr_accessor_with_default( "closed?" ) { false }

  def validate
    errors.add_to_base "#{self.class.ship_to_first_name_rus} слишком короткое (минимум 2 буквы)" if ship_to_first_name.size < 2  
    errors.add_to_base "Номер телефона слишком короткий (минимум 7 цифр)" if phone_number.size < 7  
    errors.add_to_base "Неверный формат адреса электронной почты" unless email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i  
    errors.add_to_base "Проверочный код неверен" unless captcha_validated
    errors.add_to_base "#{Cart.class_name_rus_cap} пустая" unless cart.cart_items.size > 0
  end  
    
  def self.close_object( params, session, flash )
    find( params[ :id ] ).close( flash )
#      object      
  end

  def new_or_edit1( page )
    super page
    page.new_processed_order
  end

  def create_or_update1( page, session )
    page.create_processed_order self.class.fade_duration
  end  
  
  def save_object( session, flash )
    self.captcha_validated = session[ :captcha_validated ]
    self.cart = session.cart
    save && populate_order( self.cart ) && self.cart.clear_cart( flash ) && create_notice( flash ) &&
            OrderNotice.deliver_order_notice( self )
  end     

  def populate_order( cart )
    cart.cart_items.each { |cart_item| order_items.build( cart_item.populate_order_item_hash ) }
    save
  end
  
  def close( flash ) 
    self.status = ClosedOrder.status_eng
    close_notice( flash ) 
    save( false )
    self
  end

  def close_notice( flash ); flash.now[ :notice ] = "#{Order.class_name_rus_cap} № #{id} успешно закрыт."; end

  def create_notice( flash )
    flash.now[ :notice ] =
            "<h3>Спасибо за заказ!</h3><br />В ближайшее время наши менеджеры свяжутся с Вами.<br />
            На адрес Вашей электронной почты отправлено информационное сообщение.<br />
            В случае необходимости используйте <b>номер #{self.class.class_name_rus}а #{id}.</b>"
    true
  end
      
  def closed?; false; end      
      
end
