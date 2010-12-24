module CartItemsHelper

  def after_create_or_update_cart_item( tag, amount, session )
    delay( DURATION ) do
      action :remove, tag if amount.zero? or session.cart.cart_items.empty?
      check_cart_links
      check_cart_totals( session )
    end    
  end  
  
end
