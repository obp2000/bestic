# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def index( objects )
    objects.index1( self )
  end 
 
  def show1( object )
    object.class.show1( self )
  end

  def fade_appear( fade, appear )
    fade_with_duration fade
    appear_with_duration appear    
  end

  def new_or_edit( object )
    object.new_or_edit1( self )    
  end

  def reply( object )
    object.reply1( self )
  end  
  
  def create_or_update( object, session, action_name )
    object.create_or_update1( self, session )
  end
  
  def destroy1( objects, session )
    objects.to_array.destroy1( self, session )
  end

  def close( object )
    object.close1( self )  
  end

  def attach_js( js )
    delay( DURATION ) { call( js ) }    
  end

  def action( action1, *opts )
    fade_with_duration opts.first
    delay( DURATION ) do    
      send action1, *opts
      appear_with_duration opts.first unless action1 == :remove       
#      visual_effect :appear, opts.first, :duration => DURATION unless action1 == :remove
    end
  end
    
  def show_notice( opts = {} )
    appear_duration = 1
    fade_duration = opts[:delay] || appear_duration
    insert_html :top, :content, :partial => "shared/notice"
    hide :notice
    appear_with_duration :notice, appear_duration    
#    visual_effect :appear, :notice, :duration => appear_duration
    delay( appear_duration ) do
      fade_with_duration :notice, fade_duration
      delay( fade_duration ) do
        remove :notice
      end
    end
  end

  def link_to_back( object )
    object.class.link_to_back( self )
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
    object.link_to_add_to_item( self )
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

  def link_to_show_with_comment( object )
    object.link_to_show_with_comment( self )
  end  
  
  def page_title
    "<h2>#{@page_title}</h2>"
  end
  
  def link_to_index( class_const, params = nil )
    class_const.link_to_index( self, params )     
  end    

  def link_to_show( object )
    object.link_to_show( self )              
  end  
  
  def link_to_new( class_const )
    class_const.link_to_new( self )  
  end  
  
  def link_to_reply_to( object )
    object.link_to_reply( self )                 
  end  
  
  def link_to_delete( object )
    object.link_to_delete( self )    
  end
  
  def link_to_close( object )
    object.link_to_close( self )    
  end  
  
  def link_to_logout( class_const )
    link_to class_const.logout_text, logout_path
  end

  def submit_to( class_const )
    class_const.submit_to( self )
  end

  def link_to_season( season_class )
    season_class.link_to_season( self )
  end

  def link_to_category( category, season_class )
    category.link_to_category( self, season_class.name.tableize )
  end
  
  def render_attrs( attrs )
    attrs.to_array.render_attrs( self ) rescue nil  
  end

  def render_options( objects )
    objects.to_array.render_options( self ) rescue nil     
  end

############################
  def link_to_function1( image, title = "", block = nil )
    link_to_function image_tag( image, :title => title ), &block    
  end  

  def link_to_function2( image, title = "", js_string = "" )
    link_to_function image_tag( image, :title => title ), js_string    
  end   
 
  def link_to_remote1( image, text, url = [], opts = {} )
    link_to_remote( ( image_tag( *image ) rescue "" ) + text, { :url => send( *url ) }.merge( opts ) )      
  end 

  def link_to1( image, text, url = [], opts = {} )
    link_to( ( image_tag( *image ) rescue "" ) + text, ( send( *url ) rescue url ), opts )
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

  def show2( appear_tag, fade_tag )
    action :replace_html, appear_tag, :partial => "show"
    fade_appear fade_tag, appear_tag          
  end

  def insert_index_partial( index_tag, index_partial, objects )
    action :remove, index_tag
    delay( DURATION ) do
      insert_html :after, "tabs",  :partial => index_partial, :locals => { :objects => objects }
    end    
  end

  def replace_index_partial( index_tag, index_partial, objects )
    page.action :replace_html, index_tag,  :partial => index_partial, :locals => { :objects => objects }    
  end

  def add_to_item1( tag, index_tag, insert_attr, object )
    action :remove, tag      
    delay( DURATION ) do
      insert_html :bottom, "form_#{index_tag}", :partial => "items/#{insert_attr}", :object => object
    end    
  end
  
  def destroy2( edit_tag, tag )
    action :remove, edit_tag rescue nil      
    action :remove, tag rescue nil    
  end

  def new_forum_post
    delay( DURATION ) do
      fade_with_duration :post      
      fade_with_duration :link_to_reply
    end  
  end
  
  def fade_with_duration( tag, duration = DURATION )
    visual_effect :fade, tag, :duration => duration    
  end

  def appear_with_duration( tag, duration = DURATION )
    visual_effect :appear, tag, :duration => duration    
  end  
  
  def reply1
    delay( DURATION ) { fade_with_duration :link_to_reply }
  end

  def new_processed_order
    delay( DURATION ) { check_cart_links }      
  end

  def create_or_update1( create_or_update_tag, index_tag, create_or_update_partial, duration_fade, object )
    action :remove, create_or_update_tag, :duration => DURATION      
    delay( DURATION ) do      
      insert_html :bottom, index_tag, :partial => create_or_update_partial, :object => object 
    end
    show_notice( :delay => duration_fade )    
    visual_effect :highlight, create_or_update_tag, :duration => HIGHLIGHT_DURATION
    fade_with_duration :errorExplanation        
  end

  def create_or_update_forum_post( parent_id, parent_tag, partial, object )
    place, tag = parent_id == 0 ? [ "top", "posts" ]  : [ "after", parent_tag ]
    insert_html place, tag, :partial => partial, :object => object
    fade_with_duration :post
    fade_with_duration :new_forum_post      
  end

  def after_create_or_update_item_attribute( new_tag, new_or_edit_partial, create_or_update_partial, object )
    replace new_tag, :partial => create_or_update_partial, :object => object.class.new rescue nil                      
    replace tag, :partial => "items/" + new_or_edit_partial, :object => object rescue nil     
  end

  def after_create_or_update_cart_item( tag, amount, session )
    delay( DURATION ) do
      action :remove, tag unless amount > 0 rescue nil
      check_cart_links
      check_cart_totals( session )
    end    
  end

  def create_processed_order( duration_fade )
    delay( duration_fade ) { redirect_to "/" }    
  end

end

class Array
  
  def render_attrs( page )
    return "Любой" if first.id.blank?     
    page.render :partial => "shared/#{first.class.name.underscore}", :collection => self, :spacer_template => "shared/comma"
  end  
  
  def render_options( page )
    page.render :partial => "catalog_items/attr", :collection => self,
        :locals => { :checked => ( first.new_record? || !second ),
        :visibility => ( second || first.new_record? ) ? "visible" : "hidden" }
  end
  
  def destroy1( page, session )
    each do |object|
      object.destroy1( page, session )        
    end   
    page.show_notice
  end  
 
  def index1( page )
    first.class.index1( page, self )
    page.show_notice      
  end
 
end
