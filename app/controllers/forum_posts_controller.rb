class ForumPostsController < ApplicationController
  before_filter :login_required, :only => [ :destroy ]
  
  def reply
    @object = controller_name.classify.constantize.reply( params )
    page_title    
    render_action1    
  end
  
end
