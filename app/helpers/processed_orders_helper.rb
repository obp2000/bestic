module ProcessedOrdersHelper

  def create
    delay = 20
    visual_effect :fade, 'errorExplanation' , :duration => DURATION
    show_notice :delay => delay
    delay(delay) do
      redirect_to "/"
    end
  end
  
  def close( order )
    action :replace_html, order.status_tag, ClosedOrder::STATUS_RUS
    action :replace_html, order.updated_tag, date_time_rus( order.updated_at )
    action :replace_html, "order_processed", ProcessedOrder.count
    visual_effect :fade, order.close_tag, :duration => DURATION
    show_notice
  end

  def link_to_close_processed_order( order )
    link_to_remote image_tag( *ProcessedOrder.close_image_with_title ), :url => close_processed_order_path( order ),
          :method => :get, :html => { :id => order.close_tag }, :confirm => ProcessedOrder.close_confirm
  end
  
end
