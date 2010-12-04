module ProcessedOrdersHelper

  def link_to_close( object )
    opts = lambda { |image, url| [ image, { :url => url, :method => :get, :html => { :id => close_tag },
            :confirm => self.class.close_confirm } ] }
    link_to_remote *opts.bind( object )[ image_tag( *object.class.close_image_with_title ),
            send( "close_#{object.class.name.underscore}_path", object ) ]           
  end
  
end
