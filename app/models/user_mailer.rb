# encoding: utf-8
class UserMailer < ActionMailer::Base

  def self.deliver_notifications( user )
     deliver_activation(user) if user.recently_activated?
     deliver_forgot_password(user) if user.password_forgotten     
  end
  
  def signup_notification(user)
    setup_email(user)
    subject      "Магазин одежды для той-терьеров: Активируйте, пожалуйста, Вашу новую учетную запись"
  end
  
  def activation(user)
    setup_email(user)
    subject      "Магазин одежды для той-терьеров: Ваша учетная запись активирована!"
  end
  
  def forgot_password(user)
    setup_email(user)
    subject      "Магазин одежды для той-терьеров: Переустановка пароля" 
  end 
  
  protected
  def setup_email(user)
    recipients   "#{user.email}"
    from         "obp2000@mail.ru"
    sent_on      Time.now
    body         :user => user
  end
  
end
