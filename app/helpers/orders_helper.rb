module OrdersHelper

  def link_to_show_order_item( order_item )
    ( link_to_remote order_item.name, :url => item_path( order_item.item ),
                  :method => :get ) rescue OrderItem.deleted_item_notice              
  end
  
end
