# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def index( objects )
    objects.first.class.index_block[ page, objects ]
    objects.first.class.after_index_block[ page, objects ] rescue nil     
    show_notice
  end 
 
  def show1( object )
    action :replace_html, object.class.appear_content, :partial => "show"
    fade_appear *object.class.fade_appear_args
  end

  def fade_appear( fade, appear )
    with_options :duration => DURATION do | with_duration |
      with_duration.visual_effect :fade, fade
      with_duration.visual_effect :appear, appear
    end
  end

  def new_or_edit( object )
    opts1 = lambda { |replace| [ replace, content_for_new_or_edit,
            { :partial => self.class.new_or_edit_partial, :object => self } ]  }
    action *opts1.bind( object )[ object.class.replace ]
    delay( DURATION ) do       
      object.class.after_new_or_edit_block[ page, object ] rescue nil
    end
  end

  def reply( object )
    opts1 = lambda { |replace| [ replace, content_for_new_or_edit,
            { :partial => self.class.new_or_edit_partial, :object => self } ]  }
    action *opts1.bind( object )[ object.class.replace ]
    delay( DURATION ) do       
      object.class.after_reply_block[ page, object ] rescue nil
    end
  end  
  
  def create_or_update( object, session, action_name )
    object.class.create_or_update_block[ page, object, session ]
    delay( DURATION ) do        
      object.class.after_create_or_update_block[ page, object, session ] rescue nil
    end
    show_notice( :delay => object.class.duration_fade )    
    visual_effect :highlight, object.content_for_create_or_update, :duration => HIGHLIGHT_DURATION
    visual_effect :fade, :errorExplanation, :duation => DURATION 
  end
  
  def destroy1( objects, session )
    objects = objects.to_array   
    objects.first.class.destroy_block[ page, objects, session ]
    delay( DURATION ) do   
      objects.first.class.after_destroy_block[ page, objects, session ] rescue nil
    end
    show_notice
  end

  def close( object )
    object.class.close_block[ page, object ]  
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
    name = class_const.send( params[ :sort_by ] ).first.class.index_text rescue class_const.class_name_rus_cap.pluralize rescue ""
#    link_to_remote *class_const.link_to_index_block.bind( class_const )[ ( send( *class_const.index_image_with_title ) rescue "" ) + 
#            ( name rescue "" ), send( *class_const.plural_path( params ) ) ]
    image = ""
    image = image_tag( *class_const.index_image_with_title ) if ( class_const.index_image_with_title rescue false ) 

    link_to_remote image +
              name, send( *class_const.plural_path( params ) ), :method => :get        
  end    

  def link_to_show( object )
    link_to_remote *object.class.link_to_show_block.bind( object )[ ( send( *object.class.show_image_with_title ) rescue "" ) + 
            ( object.class.class_name_rus_cap.pluralize rescue "" ), send( *object.single_path ) ] rescue object.class.deleted_notice     
  end  
  
  def link_to_new( class_const )
    link_to_remote *class_const.link_to_new_block.bind( class_const )[ send( *class_const.new_image_with_title ) + 
            ( class_const.new_text rescue "" ), send( *class_const.new_path ) ]
  end  
  
  def link_to_reply_to( object )
    link_to_remote *object.class.link_to_reply_block.bind( object )[ send( *object.class.reply_image_with_title ) + 
            ( object.class.reply_text rescue "" ), send( *object.class.reply_path ) ]          
  end  
  
  def link_to_delete( object )
    link_to_remote *object.class.link_to_delete_block.bind( object )[ send( *object.delete_image_with_title ) +
    ( object.class.delete_text rescue "" ), send( *object.single_path ) ]
  end
  
  def link_to_close( object )
    link_to_remote *object.class.link_to_close_block.bind( object )[ send( *object.close_image_with_title ),
            send( *object.close_path ) ]            
  end  
  
  def link_to_logout( class_const )
    link_to class_const.logout_text, logout_path
  end  
  
  def submit_form( f, label )
    f.submit label, :onclick => "$(this).fadeOut().fadeIn()"
  end

  def link_to_season( season_class )
    opts = lambda { |image, url|  [ image + season_name + " (#{count})",
                { :url => url, :method => :get, :complete => "attach_js()" } ] }
    link_to_remote *opts.bind( season_class )[ image_tag( season_class.season_icon ),
            send( "#{season_class.name.tableize}_path" ) ]
  end

  def link_to_category( category, season_class )
    opts = lambda { |season, url| [ name + " (#{send( season ).size})",
                { :url => url, :method => :get, :complete => "attach_js()", :html => { :class => "category" } } ] }    
    link_to_remote *opts.bind( category )[ season_class.name.tableize,
            send( "category_#{season_class.name.tableize}_path", category ) ]
  end
  
  def render_attrs( attrs )
    attrs = attrs.to_array
    return "Любой" if attrs.first.id.blank?
    opts = lambda { [  :partial => "shared/#{first.class.name.underscore}", :collection => self,
          :spacer_template => "shared/comma" ] }
    render *opts.bind( attrs ).call    
  end

  def render_options( objects )
    objects = objects.to_array    
    opts = lambda { [ :partial => "catalog_items/attr", :collection => self,
          :locals => { :checked => (  first.new_record? || !self.second ),
          :visibility => ( second || first.new_record? ) ? "visible" : "hidden" } ] }
    render *opts.bind( objects ).call
  end

end

class Object
  
  def to_array
    is_a?( Array ) ? self : to_a 
  end
  
end
