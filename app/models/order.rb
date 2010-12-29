# coding: utf-8
class Order < ActiveRecord1
  attr_protected :id, :status, :updated_at, :created_at
  attr_accessor :captcha_validated, :cart

  has_many :order_items 
  has_many :items, :through => :order_items

  delegate :total, :to => :order_items

  set_inheritance_column "status"

  self.class_name_rus = "заказ"  
  self.class_name_rus_cap = "Заказ"
  self.updated_at_rus = "Закрыт"
#  self.index_tag = "content"    
  self.index_partial = "orders/index"
  self.fade_tag = "item_content"
  self.appear_tag = "order_details"  

  class_inheritable_accessor :id_rus, :status_header_rus, :total_rus, :count_rus, :email_rus, :phone_number_rus,
    :ship_to_first_name_rus, :ship_to_city_rus, :ship_to_address_rus, :comments_rus, :details_title,
    :status_eng, :status_rus_nav, :status_rus
    
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
  self.status_eng = ""
  self.status_rus_nav = ""
  self.status_rus = ""

  class << self
  
    def all_objects( params ); paginate( :page => params[ :page ], :order => 'created_at desc', :per_page => 14 ); end
    
    def index_page_title( params ); "Список #{class_name_rus}ов" + params[ :controller ].classify.constantize.status_rus_nav; end

    include Index1      
  
  end

  def link_to_close( page )
    page.link_to_remote1 [ self.class.close_image, { :title => self.class.close_title } ] , "", close_path, :method => :get,
            :html => { :id => close_tag }, :confirm => self.class.close_confirm
  end

  def close_path; [ "close_#{self.class.name.underscore}_path", self ]; end

  def destroy1( page, session )
    super page, session
    page.update_processed_orders_amount1
  end 

  def destroy_notice( flash ); flash.now[ :notice ] = "#{self.class.class_name_rus_cap} № #{id} успешно удалён."; self; end

  def status_tag; "order_status_#{id}"; end

  def updated_tag; "order_updated_#{id}"; end       

  def close_tag; "close_order_#{id}"; end    
       
end
