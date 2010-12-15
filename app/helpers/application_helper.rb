# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def index( objects )
    objects.first.class.index_block1.bind( objects )[ self ]
  end 
 
  def show1( object )
    object.class.show_block1[ self ]
  end

  def fade_appear( fade, appear )
    with_options :duration => DURATION do | with_duration |
      with_duration.visual_effect :fade, fade
      with_duration.visual_effect :appear, appear
    end
  end

  def new_or_edit( object )
    object.new_or_edit_block1[ self ]    
  end

  def reply( object )
    object.reply_block1[ self ]
  end  
  
  def create_or_update( object, session, action_name )
    object.create_or_update_block1[ self, session ]
  end
  
  def destroy1( objects, session )
    objects.to_array.destroy1[ self, session ]
  end

  def close( object )
    object.close_block[ self ]  
  end

  def action( action1, *opts )
    visual_effect :fade, opts.first, :duration => DURATION
    delay( DURATION ) do    
      send action1, *opts
      visual_effect :appear, opts.first, :duration => DURATION unless action1 == :remove
    end
  end
    
  def show_notice( opts = {} )
    appear_duration = 1
    fade_duration = opts[:delay] || appear_duration
    insert_html :top, :content, :partial => "shared/notice"
    hide :notice
    visual_effect :appear, :notice, :duration => appear_duration
    delay( appear_duration ) do
      visual_effect :fade, :notice, :duration => fade_duration
      delay( fade_duration ) { remove :notice }
    end
  end

  def link_to_back( object )
    object.class.link_to_back_block[ self ]
  end 

  def check_cart_links
    replace_html "link_to_new_order_form", :partial => "carts/link_to_new_order_form"
    replace_html "link_to_clear_cart", :partial => "carts/link_to_clear_cart"       
  end

  def check_cart_totals( session )
    replace_html "cart_total_items", session.cart.total_items
    replace_html "cart_total_sum", session.cart.total_sum
  end

  def link_to_add_to_item( object )
    object.link_to_add_to_item_block[ self ]
  end

  def red_star
    "<span style='color: red'>*</span>"
  end
    
  def roubles( arg )
    number_to_currency( arg, :unit => "", :precision => 0, :delimiter => " ")  
  end

  def date_time_rus( arg )
    arg.strftime("%d.%m.%yг.&nbsp;%H:%M:%S") rescue ""
  end

  def do_not_show( cart )
    controller_name == 'processed_orders' or cart.cart_items.empty?
  end
  
  def link_to_show_photo( photo )
    photo.link_to_show_photo_block[ self ]
  end

  def link_to_show_photo_with_comment( photo )
    photo.link_to_show_photo_with_comment_block[ self ]
  end  
  
  def page_title
    "<h2>#{@page_title}</h2>"
  end
  
  def link_to_index( class_const, params = nil )
    class_const.link_to_index_block[ self, params ]     
  end    

  def link_to_show( object )
    object.link_to_show_block[ self ]              
  end  
  
  def link_to_new( class_const )
    class_const.link_to_new_block[ self ]  
  end  
  
  def link_to_reply_to( object )
    object.link_to_reply_block[ self ]                 
  end  
  
  def link_to_delete( object )
    object.link_to_delete_block[ self ]    
  end
  
  def link_to_close( object )
    object.link_to_close_block[ self ]    
  end  
  
  def link_to_logout( class_const )
    link_to class_const.logout_text, logout_path
  end

  def submit_to( class_const )
    send( *class_const.submit_image_with_options )    
  end

  def link_to_season( season_class )
    season_class.link_to_season_block[ self ]
  end

  def link_to_category( category, season_class )
    category.link_to_category_block[ self, season_class.name.tableize ]
  end
  
  def render_attrs( attrs )
    attrs.to_array.render_attrs[ self ]
  end

  def render_options( objects )
    objects.to_array.render_options[ self ]    
  end

end

class Array
  
  def render_attrs
    first.render_attrs_block.bind( self )    
  end
  
  def render_options
    first.render_options_block.bind( self )    
  end  

  def destroy1
    first.destroy_block1.bind( self )    
  end    
  
end

