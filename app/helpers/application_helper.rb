# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def index( objects )
    objects.first.class.index_block.bind( objects )[ self ]
    objects.first.class.after_index_block.bind( objects )[ self ] rescue nil
    show_notice
  end 
 
  def show1( object )
    object.show_block[ self ]
    delay( DURATION ) do
      object.after_show_block[ self ] rescue nil      
    end    
  end

  def fade_appear( fade, appear )
    with_options :duration => DURATION do | with_duration |
      with_duration.visual_effect :fade, fade
      with_duration.visual_effect :appear, appear
    end
  end

  def new_or_edit( object )
    object.new_or_edit_block[ self ]    
    delay( DURATION ) do       
      object.after_new_or_edit_block[ self ] rescue nil
    end
  end

  def reply( object )
    object.reply_block[ self ]     
    delay( DURATION ) do       
      object.after_reply_block[ self ] rescue nil
    end
  end  
  
  def create_or_update( object, session, action_name )
    object.create_or_update_block[ self, session ]
    delay( DURATION ) do        
      object.after_create_or_update_block[ self, session ] rescue nil
    end
    show_notice( :delay => object.class.duration_fade )    
    visual_effect :highlight, object.content_for_create_or_update, :duration => HIGHLIGHT_DURATION
    visual_effect :fade, :errorExplanation, :duation => DURATION 
  end
  
  def destroy1( objects, session )
    objects = objects.to_array
    objects.each do |object|
      object.destroy_block[ self ]        
    end   
    delay( DURATION ) do
      objects.each do |object|
        object.after_destroy_block[ self, session ] rescue nil        
      end
    end
    show_notice
  end

  def close( object )
    object.close_block[ self ]  
    show_notice
  end

  def action( action1, content, opts = {} )
    visual_effect :fade, content, :duration => DURATION
    delay( DURATION ) do    
      send action1, content, opts
      visual_effect :appear, content, :duration => DURATION unless action1 == :remove
    end
  end
    
  def show_notice( opts = {} )
    duration_appear = 1
    duration_fade = opts[:delay] || duration_appear
    insert_html :top, :content, :partial => "shared/notice"
    hide :notice
    visual_effect :appear, :notice, :duration => duration_appear
    delay( duration_appear ) do
      visual_effect :fade, :notice, :duration => duration_fade
      delay( duration_fade ) { remove :notice }
    end
  end

  def link_to_back( object )
    link_to_function image_tag( *object.class.back_image_with_title ) do |page|
      page.fade_appear( *object.class.appear_fade_args )      
    end
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
    link_to_function image_tag( *object.class.add_to_item_image_with_title ) do |page|
      page.add_to_item( object )
    end
  end

  def add_to_item( object )
    object.class.add_to_item_block[ page, object ]
    object.class.after_add_to_item_block[ page, object ] rescue nil     
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
  
  def link_to_show_photo( photo, show_comment = true )
    opts = lambda { |image, show_comment1| [ image + ( show_comment1 ? comment || "" : "" ), public_filename ] }
    link_to *opts.bind( photo )[ image_tag( photo.public_filename( :small ) ), show_comment ]
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
  
  def submit_form
    
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
    attrs = attrs.to_array
    return "Любой" if attrs.first.id.blank?
    attrs.first.render_attrs_block.bind( attrs )[ self ]
  end

  def render_options( objects )
    objects = objects.to_array    
#    opts = lambda { [ :partial => "catalog_items/attr", :collection => self,
#          :locals => { :checked => ( first.new_record? || !self.second ),
#          :visibility => ( second || first.new_record? ) ? "visible" : "hidden" } ] }
#    render *opts.bind( objects ).call
    objects.first.render_options_block.bind( objects )[ self ]
  end

end

class Object
  
  def to_array
    is_a?( Array ) ? self : to_a 
  end
  
end
