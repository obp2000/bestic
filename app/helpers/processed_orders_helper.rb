module ProcessedOrdersHelper

  def new_processed_order
    delay( DURATION ) { check_cart_links }      
  end 
 
  def create_processed_order( fade_duration )
    show_notice( :delay => fade_duration ) 
    delay( fade_duration ) { redirect_to "/" }    
  end 
 
  def update_processed_orders_amount
    action :replace_html, "processed_orders_amount", ProcessedOrder.count    
  end

  def update_processed_orders_amount1
    delay( DURATION ) do
      update_processed_orders_amount
    end
  end

  def change_to_closed( status_tag )
    action :replace_html, status_tag, ClosedOrder::STATUS_RUS    
  end

  def change_close_tag_to( updated_tag, updated_at )
    action :replace_html, updated_tag, date_time_rus( updated_at )
  end
  
  def close1( status_tag, updated_tag, updated_at )
    change_to_closed status_tag
    change_close_tag_to updated_tag, updated_at
    update_processed_orders_amount    
    show_notice
  end 
 
end
