# coding: utf-8
class Order < ActiveRecord1
  attr_protected :id, :status, :updated_at, :created_at
  attr_accessor :captcha_validated, :cart

  has_many :order_items 
  has_many :items, :through => :order_items

  delegate :total, :to => :order_items

  set_inheritance_column "status"

  STATUS_RUS_NAV = ""
  STATUS_RUS = ""

  self.class_name_rus = "заказ"  
  self.class_name_rus_cap = "Все заказ"
  self.updated_at_rus = "Закрыт"
#  self.index_tag = "content"    
  self.index_partial = "orders/index"
  self.fade_tag = "item_content"
  self.appear_tag = "order_details"  

  class_inheritable_accessor :id_rus, :status_header_rus, :total_rus, :count_rus, :email_rus, :phone_number_rus,
    :ship_to_first_name_rus, :ship_to_city_rus, :ship_to_address_rus, :comments_rus, :details_title
    
  self.id_rus = "№"
  self.status_header_rus = "Статус"
  self.total_rus = "Сумма"    
  self.count_rus = "Всего"    
  self.email_rus = "Адрес электронной почты"
  self.phone_number_rus = "Контактный телефон"    
  self.ship_to_first_name_rus = "Имя"    
  self.ship_to_city_rus = "Город"    
  self.ship_to_address_rus = "Адрес"    
  self.comments_rus = "Комментарии к #{class_name_rus}у"    
  self.details_title = "Детали #{class_name_rus}а"    

  class << self
  
    def all_objects( params ); paginate( :page => params[:page], :order => 'created_at desc', :per_page => 14 ); end
    
    def index_page_title; "Список #{class_name_rus}ов" + self::STATUS_RUS_NAV; end
      
    def show_close_column; ProcessedOrder.count > 0; end

    include Index1      
  
  end

  def destroy1( page, session )
    super page, session
    page.update_processed_orders_amount1
  end 

  def closed?; status == STATUS_OF_CLOSED_ORDER; end

  def destroy_notice; "#{self.class.class_name_rus_cap} № #{id} успешно удалён."; end

  def status_tag; "order_status_#{id}"; end

  def updated_tag; "order_updated_#{id}"; end       

  def close_tag; "close_order_#{id}"; end    
       
end
