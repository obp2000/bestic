class ProcessedOrdersController < OrdersController

  validates_captcha

  def create
    super captcha_validated?
  end

  def close
    @object = controller_name.classify.constantize.close_object( params, session )
    flash_notice
    render_action1   
  end
  
end
