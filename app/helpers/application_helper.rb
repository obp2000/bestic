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
    with_options :duration => DURATION do | with_duration |
      with_duration.visual_effect :fade, fade
      with_duration.visual_effect :appear, appear
    end
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
 
  def link_to_season1( season_icon, season_name, count, path )
    link_to_remote image_tag( season_icon ) + season_name + " (#{count})",
              :url => send( *path ), :method => :get      
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
