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
    @objects = controller_name.classify.constantize.all_objects( params, flash )
    @object = controller_name.classify.constantize.new_object( params, session )
    @objects = [ @object ] if @objects.empty?
    render_block_call     
  end

  def show
    @object = controller_name.classify.constantize.find( params[ :id ] )
    render_block_call    
  end

  def new
    @object = controller_name.classify.constantize.new1
    render_block_call    
  end

  def edit
    @object = controller_name.classify.constantize.find( params[ :id ] )
    render_block_call    
  end

  def create( captcha_validated = nil )
    @object = controller_name.classify.constantize.new_object( params, session )
    session[ :captcha_validated ] = captcha_validated
    render_block_call( ( "new" unless @object.save_object( session, flash ) ) )        
  end

  def update
    @object, success = controller_name.classify.constantize.update_object( params, session, flash )
    render_block_call( ( "edit" unless success ) )     
  end

  def destroy
    @objects = @object = controller_name.classify.constantize.destroy_object( params, session, flash )
    render_block_call    
  end
    
  private
  
    def render_block_call( action = nil )
      controller_name.classify.constantize.send( "#{action || action_name}_render_block" ).bind( self )[]
    end

end
