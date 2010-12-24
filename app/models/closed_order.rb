# coding: utf-8
class ClosedOrder < Order

  self.class_name_rus_cap = "Закрытые заказ"   

  STATUS = "ClosedOrder"
  STATUS_RUS = "закрыт"
  STATUS_RUS_NAV = " со статусом \"закрытые\"" 

  def closed?; true; end
     
end
