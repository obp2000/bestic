# coding: utf-8
class ClosedOrder < Order

  STATUS = "ClosedOrder"
  STATUS_RUS = "закрыт"
  STATUS_RUS_NAV = " со статусом \"закрытые\"" 

  def closed?; true; end
     
end
