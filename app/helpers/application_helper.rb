# coding: utf-8
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
 
  def content( opts = {} )
    opts1 = lambda { [ ( self[:object].class.content rescue false ) || self[:objects].first.class.content,
                                     ( self[:object].class.partial rescue false ) || self[:objects].first.class.partial ] }
    content1, partial = opts1.bind( opts )[]
    with_options :partial => partial, :object => opts[:object], :complete => "attach_js",
            :locals => { :objects => opts[:objects] } do |with_opts|
      if ( opts[:object].class.insert_html rescue false )
        action :remove, content1
        with_opts.insert_html :after, "tabs"
      else
        with_opts.action :replace_html, content1
      end
    end
    show_notice
    check_cart_links  
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

  def show1( opts = {} )
    action :replace_html, opts[:object].class.appear_content, :partial => "show"
    fade_appear *opts[:object].class.fade_appear_args
  end

  def link_to_back( object )
    link_to_function image_tag( *object.class.back_image_with_title ) do |page|
      page.fade_appear( *object.class.appear_fade_args )      
    end
  end 

  def fade_appear( fade, appear )
    with_options :duration => DURATION do | with_duration |
      with_duration.visual_effect :fade, fade
      with_duration.visual_effect :appear, appear
    end
  end

  def new_or_edit( opts = {} )
    opts1 = lambda { |replace| [ replace, content_for_new_or_edit,
            { :partial => self.class.new_or_edit_partial, :object => self } ]  }
    action *opts1.bind( opts[:object] )[ opts[:object].class.replace_html1 ? :replace_html : :replace ]             
    check_cart_links
    visual_effect :fade, :post, :duration => DURATION
    visual_effect :fade, :reply, :duration => DURATION
  end
  
  def action( action1, content, opts = {} )
    visual_effect :fade, content, :duration => DURATION
    delay( DURATION ) do    
      send action1, content, opts
      visual_effect :appear, content, :duration => DURATION unless action1 == :remove
      call("attach_yoxview")
      call( "attach_mColorPicker" ) if opts[:object].class  == Colour           
    end
  end
  
  def create_or_update( opts = {} )
    visual_effect :fade, opts[:object].content_for_create_or_update, :duration => DURATION
    delay( DURATION ) do      
      remove opts[:object].content_for_create_or_update
      with_options :partial => opts[:object].class.create_or_update_partial do |with_partial|
        if ( opts[:object].amount > 0 rescue true )
          with_partial.insert_html *opts[:object].create_or_update_insert_html_args rescue nil
          select( "##{opts[:object].class.list_tag} last-child" ).fadeOut( 0 )
          select( "##{opts[:object].class.list_tag} last-child" ).fadeIn( DURATION )
        end
        with_partial.replace *opts[:object].create_or_update_replace_args unless opts[:object].class == Photo rescue nil      
      end
      call( "attach_mColorPicker" ) if opts[:object].class  == Colour       
    end
    replace *opts[:object].create_or_update_replace_form_args rescue nil    
    check_cart_totals( opts )
    check_cart_links
    visual_effect :highlight, opts[:object].content_for_create_or_update, :duration => HIGHLIGHT_DURATION
    show_notice( :delay => opts[:object].class.duration_fade )
    visual_effect :fade, :errorExplanation, :duation => DURATION 
  end
  
  def destroy1( opts = {} )
    opts[:objects] = [opts[:objects]] unless opts[:objects].respond_to?(:each)   
    opts[:objects].each do |object|
      action :remove, object.edit_tag      
      action :remove, object.tag
    end
    check_cart_totals( opts )    
    check_cart_links
    action :replace_html, "order_processed", ProcessedOrder.count
    show_notice
  end

  def check_cart_links
    replace_html "link_to_new_order_form", :partial => "carts/link_to_new_order_form"
    replace_html "link_to_clear_cart", :partial => "carts/link_to_clear_cart"       
  end

  def check_cart_totals( opts )
    replace_html "cart_total_items", opts[:session].cart.total_items
    replace_html "cart_total_sum", opts[:session].cart.total_sum
  end

  def link_to_add_to_item( object )
    link_to_function image_tag( *object.class.add_to_item_image_with_title ) do |page|
      page.add_to_item( object )
    end
  end

  def add_to_item( object )
    opts = lambda { |partial| [ "form_#{self.class.list_tag}", { :partial => "items/#{partial}", :object => self } ] }
    if Item.new.respond_to?( object.class.name.underscore )
      action :replace_html, *opts.bind( object )[ object.class.name.underscore ]  
    else
      remove object.tag
      insert_html :bottom, *opts.bind( object )[ "attr" ]  
    end
    call("attach_yoxview") if object.class.attach_yoxview?    
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
    opts = lambda { |image, show_comment1| [ image + ( show_comment1 ? comment : "" ), public_filename ] }
    link_to *opts.bind( photo )[ image_tag( photo.public_filename( :small ) ), show_comment ]
  end
  
  def page_title
    "<h2>#{@page_title}</h2>"
  end
  
  def link_to_delete( object )
    link_to_remote image_tag( *object.delete_image_with_title ), :url => send( "#{object.class.name.underscore}_path", object  ),
          :method => :delete, :confirm => object.delete_title        
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
    attrs = [ attrs ] unless attrs.is_a?( Array )
    return "Любой" if attrs.first.id.blank?
    opts = lambda { [  :partial => "shared/#{first.class.name.underscore}", :collection => self,
          :spacer_template => "shared/comma" ] }
    render *opts.bind( attrs ).call    
  end

  def render_options( objects )
    objects = [ objects ] unless objects.is_a?( Array )
    opts = lambda { [ :partial => "catalog_items/attr", :collection => self,
          :locals => { :checked => (  first.new_record? || !self.second ),
          :visibility => ( second || first.new_record? ) ? "visible" : "hidden" } ] }
    render *opts.bind( objects ).call
  end
   
end
