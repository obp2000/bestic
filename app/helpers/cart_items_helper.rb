module CartItemsHelper

  def after_create_or_update_cart_item( tag, amount, session )
    delay( DURATION ) do
#      p amount.to_s + "   ssssssssssssssssssssssssssssssssssssss"
      action :remove, tag if amount == 0 or session.cart.cart_items.size == 0
      check_cart_links
      check_cart_totals( session )
    end    
  end  
  
end
