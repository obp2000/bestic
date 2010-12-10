# coding: utf-8
class Contact < ActiveRecord::Base
#  validates_length_of :name, :in => 2..255
#  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i 
#  validates_length_of :phone, :in => 7..20
  
  def validate
    errors.add_to_base "В имени должно быть не менее двух символов" if name.size < 2  
    errors.add_to_base "Неверный формат адреса электронной почты" if email !~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i   
    errors.add_to_base "В номере телефона должно быть не менее семи символов" if phone.size < 7  
  end
  
#  extend Shared 
  class << self
  
    def class_name_rus; "контакт"; end

    def class_name_rus_cap; "Контакт"; end
      
    def show_text; class_name_rus_cap.pluralize; end       

    def show_page_title; class_name_rus_cap; end

    def change_text; "Изменить контакты"; end  

    def save_image; "document-save.png"; end

    def show_image; "contacts.png"; end
  
    def name_rus; "Имя"; end

    def name_image; "loginmanager.png"; end

    def email_rus; "E-mail"; end

    def email_image; "mail_generic.png"; end
    
    def phone_rus; "Телефон"; end

    def phone_image; "kcall.png"; end  
    
    def address_rus; "Адрес"; end

    def address_image; "kfm_home.png"; end
  
    def icq_rus; "ICQ"; end
  
    def icq_image; "icq_protocol.png"; end

    def email_subject; "Сообщение от пользователя интернет-магазина BEST&C"; end
      
# for "shared/show.rjs"
    def fade_tag; "content";  end
    def appear_tag; "content"; end        

  end

  def update_notice; "#{self.class.class_name_rus_cap} успешно обновлены."; end

end
