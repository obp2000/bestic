class ProcessedOrdersController < OrdersController

  validates_captcha

  def create
    super captcha_validated?
  end

  def close
    @object = controller_name.classify.constantize.close_object( params, session, flash )
#    flash_notice
    render_block_call  
  end
  
end
