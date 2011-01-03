# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def index( objects ); objects.index1( self ); end 

  [ :show1, :new_or_edit, :reply, :link_to_add_to_item, :link_to_show, :link_to_delete, :link_to_close, :link_to_new,
    :submit_to, :link_to_season, :link_to_back, :link_to_show_with_comment, :link_to_reply_to,
    :link_to_logout, :link_to_add_html_code_to, :link_to_remove_from_item, :link_to_change,
    :link_to_close_window, :link_to_index_local ].each do |method|
    define_method method do
      |object| object.send( method, self )
    end
  end

  [ :index_page_title_for, :show_page_title_for, :new_page_title_for ].each do |method|
    define_method method do
      |object| object.send( method, params )
    end
  end

  [ :render_attrs, :render_options ].each do |method|
    define_method method do
      |object| object.to_a.send( method, self ) rescue nil
    end
  end
  
  def create_or_update( object, session ); object.create_or_update1( self, session ); end
  
  def destroy1( objects, session ); objects.to_enum.destroy1( self, session ); end

  def close( object ); object.close1( self ); end

  def attach_js( js ); delay( DURATION ) { call( js ) }; end

  def fade_appear( fade, appear )
    fade_with_duration fade
    appear_with_duration appear    
  end

  def action( action1, *opts )
    fade_with_duration opts.first
    delay( DURATION ) do    
      send action1, *opts
      appear_with_duration opts.first unless action1 == :remove       
    end
  end
    
  def show_notice( opts = {} )
    appear_duration = 1
    fade_duration = opts[ :delay ] || appear_duration
    insert_html :top, :content, :partial => "shared/notice"
    hide :notice
    appear_with_duration :notice, appear_duration    
    delay( appear_duration ) do
#      action :remove, :notice
      fade_with_duration :notice, fade_duration
      delay( fade_duration ) do
        remove :notice
      end
    end
  end

  def check_cart_links
    replace_html "link_to_new_order_form", :partial => "carts/link_to_new_order_form"
    replace_html "link_to_clear_cart", :partial => "carts/link_to_clear_cart"       
  end

  def check_cart_totals( session )
    replace_html "cart_total_items", session.cart.total_items
    replace_html "cart_total_sum", session.cart.total
  end

  def red_star; "<span style='color: red'>*</span>"; end
    
  def roubles( arg ); number_to_currency( arg, :unit => "", :precision => 0, :delimiter => " "); end

  def date_time_rus( arg ); arg.strftime("%d.%m.%yг.&nbsp;%H:%M:%S") rescue ""; end

  def do_not_show( cart ); controller_name == 'processed_orders' or cart.cart_items.empty?; end
  
  def link_to_index( class_const, params = nil ); class_const.link_to_index( self, params ); end    

  def link_to_category( category, season_class ); category.link_to_category( self, season_class.name.tableize ); end

############################
  def link_to_function1( image, title, js_string = nil, block = nil )
    link_to_function image_tag( image, :title => title ), js_string, &block    
  end  
 
  def link_to_remote1( image, text, url, opts = {} )
    link_to_remote( image_with_text( image, text ), { :url => send( *url ) }.merge( opts ) )      
  end 

  def link_to1( image, text, url, opts = {} )
    link_to( image_with_text( image, text ), ( send( *url ) rescue url ), opts )
  end

  def image_with_text( image, text ); ( image_tag( *image ) rescue "" ) + text; end

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
  
  def destroy2( edit_tag, tag )
    action :remove, edit_tag rescue nil      
    action :remove, tag rescue nil    
  end
  
  def fade_with_duration( tag, duration = DURATION ); visual_effect :fade, tag, :duration => duration; end
  alias_method :fade, :fade_with_duration

  def appear_with_duration( tag, duration = DURATION ); visual_effect :appear, tag, :duration => duration; end  

  def create_or_update1( create_or_update_tag, index_tag, create_or_update_partial, object )
    action :remove, create_or_update_tag   
    delay( DURATION ) do      
      insert_html :bottom, index_tag, :partial => create_or_update_partial, :object => object 
    end
    show_notice   
    visual_effect :highlight, create_or_update_tag, :duration => HIGHLIGHT_DURATION
    fade_with_duration :errorExplanation        
  end

end

class Array
  
  def render_options( page )
    page.render :partial => "catalog_items/attr", :collection => self,
        :locals => { :checked => ( first.new_record? || !second ),
        :visibility => ( second || first.new_record? ) ? "visible" : "hidden" }
  end
 
   def render_attrs( page )
    return "Любой" if first.id.blank?     
    page.render :partial => "shared/#{first.class.name.underscore}", :collection => self,
            :spacer_template => "shared/comma"
  end 
  
  def index1( page )
    first.class.index1( page, self ) rescue nil
    page.show_notice      
  end
 
end

class Enumerable::Enumerator
  
  def destroy1( page, session )
    each { |object| object.destroy1( page, session ) }        
    page.show_notice
  end 
  
end

class Object
  
  def colon; self + ":"; end

  def total; inject(0) {|sum, n| n.price * n.amount + sum}; end

end

class Hash
  
  def cart; self[ :cart_id ] ? Cart.find( self[ :cart_id ] ) : Cart.create.tap { |cart1| self[ :cart_id ] = cart1.id }; end
#  def cart; Cart.find_or_create( self[ :cart_id ] ); end
  
end
