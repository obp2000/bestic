# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  [ :link_to_add_to_item, :link_to_show, :link_to_delete, :link_to_close, :link_to_new,
    :submit_to, :link_to_season, :link_to_back, :link_to_show_with_comment, :link_to_reply_to,
    :link_to_logout, :link_to_add_html_code_to, :link_to_remove_from_item, :link_to_change,
    :link_to_close_window, :link_to_index_local ].each do |method|
    define_method( method ) { |object| object.send( method, self ) }
  end

  [ :index_page_title_for, :show_page_title_for, :new_page_title_for ].each do |method|
    define_method( method ) { |object| object.send( method, params ) }
  end

  [ :render_attrs, :render_options ].each do |method|
    define_method( method ) { |object| Array( object ).send( method, self ) rescue nil }
  end

  def attach_js( js ); delay( DURATION ) { call( js ) } end

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
      fade_with_duration :notice, fade_duration
      delay( fade_duration ) do
        remove :notice
      end
    end
  end

  def check_cart_links; Cart.cart_links.each { |link| replace_html link, :partial => "carts/#{link}" } end

  def check_cart_totals( session ); session.cart.cart_totals.each { |args| replace_html *args } end

  def red_star; "<span style='color: red'>*</span>" end
    
  def roubles( arg ); number_to_currency( arg, :unit => "", :precision => 0, :delimiter => " ") end

  def date_time_rus( arg ); arg.strftime("%d.%m.%yг.&nbsp;%H:%M:%S") rescue "" end

  def do_not_show( cart ); controller_name == 'processed_orders' or cart.cart_items.empty? end
  
  def link_to_index( class_const, params = nil ); class_const.link_to_index( self, params ) end    

  def link_to_category( category, season_class ); category.link_to_category( self, season_class.name.tableize ) end

############################
  def link_to_function1( image, js_string = nil, block = nil ); link_to_function image_tag( *image ), js_string, &block end  
 
  def link_to_remote1( image, text, url, opts = {} )
    link_to_remote( image_with_text( image, text ), { :url => send( *url ) }.merge( opts ) )      
  end 

  def link_to1( image, text, url, opts = {} ); link_to( image_with_text( image, text ), ( send( *url ) rescue url ), opts ) end

  def image_with_text( image, text ); ( image_tag( *image ) rescue "" ) + text end

  def render_show( appear_tag, fade_tag )
    action :replace_html, appear_tag, :partial => "show"
    fade_appear fade_tag, appear_tag          
  end

  def insert_index_partial( index_tag, index_partial, objects )
    remove_and_insert [ :remove, index_tag ],
            [ :after, "tabs", { :partial => index_partial, :locals => { :objects => objects } } ]       
  end

  def replace_index_partial( index_tag, index_partial, objects )
    page.action :replace_html, index_tag,  :partial => index_partial, :locals => { :objects => objects }    
  end
  
  def render_destroy( edit_tag, tag ); [ edit_tag, tag ].each { |tag1| action :remove, tag1 rescue nil } end
  
  def fade_with_duration( tag, duration = DURATION ); visual_effect :fade, tag, :duration => duration end
  alias_method :fade, :fade_with_duration

  def appear_with_duration( tag, duration = DURATION ); visual_effect :appear, tag, :duration => duration end  

  def render_create_or_update( remove_args, insert_args )
    remove_and_insert remove_args, insert_args    
    show_notice
    delay( DURATION ) { visual_effect :highlight, remove_args[ 1 ], :duration => HIGHLIGHT_DURATION }
    fade_with_duration :errorExplanation        
  end

  def remove_and_insert( remove_args, insert_args )
    action *remove_args   
    delay( DURATION ) { insert_html *insert_args }
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

  def render_destroy( page, session ); each { |object| object.render_destroy( page, session ) }; page.show_notice end   
  
  def render_index( page ); first.class.render_index( page, self ) rescue nil; page.show_notice end
 
  def update_object( params, session, flash )
    self[ 0 ].update_notice( flash ) if self[ 1 ] = self[ 0 ].update_object( params, session )
  end  
  
end

#class Enumerable::Enumerator
  
# def destroy1( page, session ) render_destroy
#    each { |object| object.destroy1( page, session ) }        
#    page.show_notice
#  end 
  
#end

class Object
  
  def colon; self + ":" end

  def total; inject(0) {|sum, n| n.price * n.amount + sum} end

end

class Hash
  
  def cart; self[ :cart_id ] ? Cart.find( self[ :cart_id ] ) : Cart.create.tap { |cart1| self[ :cart_id ] = cart1.id } end
#  def cart; Cart.find_or_create( self[ :cart_id ] ) end
  
end
