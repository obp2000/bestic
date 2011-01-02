# coding: utf-8
class Contact < ActiveRecord1
#  validates_length_of :name, :in => 2..255
#  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i 
#  validates_length_of :phone, :in => 7..20

  self.class_name_rus = "контакт"
  self.class_name_rus_cap = "Контакт"
  self.fade_tag = "content"
  self.appear_tag = "content"
  self.change_text = "Изменить контакты"  

  class_inheritable_accessor :name_rus, :name_image, :email_rus, :email_image, :phone_rus, :phone_image,
    :address_rus, :address_image, :icq_rus, :icq_image, :email_subject     

  self.name_rus = "Имя"
  self.name_image = "loginmanager.png"
  self.email_rus = "E-mail"
  self.email_image = "mail_generic.png"
  self.phone_rus = "Телефон"
  self.phone_image = "kcall.png"  
  self.address_rus = "Адрес"
  self.address_image = "kfm_home.png"
  self.icq_rus = "ICQ"
  self.icq_image = "icq_protocol.png"
  self.email_subject = "Сообщение от пользователя интернет-магазина BEST&C"
#  self.show_text = class_name_rus_cap.pluralize
  self.show_image = "contacts.png"  

  attr_accessor_with_default( :show_text ) { class_name_rus_cap.pluralize }  
  
  def validate
    errors.add_to_base "В имени должно быть не менее двух символов" if name.size < 2  
    errors.add_to_base "Неверный формат адреса электронной почты" if email !~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i   
    errors.add_to_base "В номере телефона должно быть не менее семи символов" if phone.size < 7  
  end
      
#  def self.new( * ); nil; end

  def self.show_page_title_for( * ); class_name_rus_cap.pluralize; end

  def update_notice( flash ); flash.now[ :notice ] = "#{self.class.class_name_rus_cap} успешно обновлены."; end

end
