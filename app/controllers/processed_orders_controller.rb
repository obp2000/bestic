class ProcessedOrdersController < OrdersController

  validates_captcha

  def create
    super captcha_validated?
  end

  def close 
    @object = ProcessedOrder.find params[ :id ] 
    @object.close
    flash.now[ :notice ] = @object.close_notice
  end
  
end
