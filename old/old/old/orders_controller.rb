class Admin::OrdersController <  Admin::BaseController

  def index
    @status = params[:status]
    session[:status] = @status
    conditions = "status = '#{@status}'" unless @status.blank?

    status = case @status
      when "processed"
        "'для исполнения'"
      when "closed"
        "со статусом 'закрытые'"
    end
    @page_title = "Список заказов #{status}" 
    @orders = Order.paginate :page => params[:page], :order =>  'created_at desc', :per_page => 10, :conditions => conditions
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def destroy 
    @order = Order.find(params[:id]) 
    @order.destroy
    flash.now[:notice] = "Заказ успешно удалён." 
  end

  def close 
    @order = Order.find(params[:id]) 
    flash.now[:notice] = "Заказ № #{@order.id} успешно закрыт." 
    @order.close 
  end

end
