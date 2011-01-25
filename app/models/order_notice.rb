# encoding: utf-8
class OrderNotice < ActionMailer::Base
  
  def order_notice(order)
    setup_email(order)
    subject      "Магазин одежды для той-терьеров BEST&C: Информация о заказе номер #{order.id}"
  end 
  
  protected
  
  def setup_email(order)
    recipients   order.email
    from         "obp2000@mail.ru"
    body         :order => order
  end

end
