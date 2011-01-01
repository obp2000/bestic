# coding: utf-8
class ClosedOrder < Order

  self.class_name_rus_cap = "Закрытые заказ"
  self.status_eng = "ClosedOrder"
  self.status_rus_nav = " со статусом \"закрытые\""
  self.status_rus = "закрыт"   

#  attr_accessor_with_default( :closed? ) { true }

#  STATUS = "ClosedOrder"

  def closed?; true; end
     
end
