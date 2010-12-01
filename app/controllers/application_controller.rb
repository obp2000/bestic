# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
#  attr_accessor :cart
  helper :all # include all helpers, all the time
    
  layout proc{ |c| c.request.xhr? ? false : "application" }

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery
  # :secret => 'd5ebb0195fbf794c1cf10debdde5e21c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  include AuthenticatedSystem
  
  def index
    @objects, @object = controller_name.classify.constantize.all_and_new( params )
    page_title
    request.xhr? ? render_action1 : render( controller_name.classify.constantize.not_xhr_index_render )
  end

  def show
    @object = controller_name.classify.constantize.find( params[:id] )
    page_title
    render_action1    
  end

  def new
    @object = controller_name.classify.constantize.new
    page_title
    render_action1    
  end

  def edit
    @object = controller_name.classify.constantize.find( params[:id] )
    render_action1
  end

  def create( captcha_validated = nil )
    @object = controller_name.classify.constantize.new_object( params, session )
    session[ :captcha_validated ] = captcha_validated
    flash_notice    
    if @object.save_object( session )
      ( controller_name.classify.constantize.responds_to_parent rescue nil ) ? responds_to_parent { render_action1 } : render_action1        
    else
      render_action1( "new" )      
    end
  end

  def update
    @object, success = controller_name.classify.constantize.update_object( params, session )
    flash_notice
    render_action1( ( "edit" unless success ) )    
  end

  def destroy
    @objects = @object = controller_name.classify.constantize.destroy_object( params, session )
    flash_notice
    render_action1
  end
    
  private

    def page_title
      @page_title = action_with_suffix( nil, "page_title" )
    end

    def flash_notice
      if notice = action_with_suffix( nil, "notice" )
        flash.now[:notice] = notice          
      end
    end  
  
    def render_action1( *args )
      if render_hash = action_with_suffix( args[0], "render" )
        render render_hash
      end
    end
  
    def action_with_suffix( action, suffix )
      action_suffix = "#{action ||= action_name}_#{suffix}"
      [ controller_name.classify.constantize, @object ].each do |obj|  
        if result = obj.send_if_respond( action_suffix )
          return result
        end
      end
      nil
    end

end
