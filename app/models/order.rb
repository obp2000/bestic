# coding: utf-8
class Order < ActiveRecord::Base
  attr_protected :id, :status, :updated_at, :created_at
  attr_accessor :captcha_validated, :cart

  has_many :order_items 
  has_many :items, :through => :order_items

  set_inheritance_column "status"

  STATUS_RUS_NAV = ""
  STATUS_RUS = ""

#  extend Shared 
  class << self
  
    def class_name_rus; "заказ"; end  

    def class_name_rus_cap; "Все заказ"; end    
  
    def all_objects( params ); paginate( :page => params[:page], :order => 'created_at desc', :per_page => 14 ); end
    
    def index_page_title; "Список #{class_name_rus}ов" + self::STATUS_RUS_NAV; end
    
#    def destroy_render; { :template => "shared/destroy.rjs" }; end
#    def index_render; { :template => "shared/index.rjs" }; end
#    def show_render; { :template => "shared/show.rjs" }; end        

    def id_rus; "№"; end
    
    def status_header_rus; "Статус"; end
    
    def total_rus; "Сумма"; end    

    def count_rus; "Всего"; end    
    
    def updated_at_rus; "Закрыт"; end       

    def email_rus; "Адрес электронной почты"; end

    def phone_number_rus; "Контактный телефон"; end    
    
    def ship_to_first_name_rus; "Имя"; end    

    def ship_to_city_rus; "Город"; end    

    def ship_to_address_rus; "Адрес"; end    

    def comments_rus; "Комментарии к #{class_name_rus}у"; end    

    def details_title; "Детали #{class_name_rus}а"; end
      
    def show_close_column; ProcessedOrder.count > 0; end
      
# for "shared/index.rjs"
    def index_partial; "orders/index"; end
    def index_tag; "content"; end
    include IndexBlock      
      
# for "shared/show.rjs"
    def fade_tag; "item_content";  end
    def appear_tag; "order_details"; end
  
  end

  def after_destroy_block
    lambda do |page, session|
      page.action :replace_html, "order_processed", ProcessedOrder.count
    end
  end 

  def total; order_items.total; end

  def closed?; status == STATUS_OF_CLOSED_ORDER; end
  
  def create_notice
    "<h3>Спасибо за заказ!</h3><br />В ближайшее время наши менеджеры свяжутся с Вами.<br />
            На адрес Вашей электронной почты отправлено информационное сообщение.<br />
            В случае необходимости используйте <b>номер #{self.class.class_name_rus}а #{id}.</b>"
  end

  def destroy_notice; "#{self.class.class_name_rus_cap} № #{id} успешно удалён."; end

  def status_tag; "order_status_#{id}"; end

  def updated_tag; "order_updated_#{id}"; end       

  def close_tag; "close_order_#{id}"; end    
       
end
