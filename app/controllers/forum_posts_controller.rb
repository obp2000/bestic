class ForumPostsController < ApplicationController
  before_filter :login_required, :only => [ :destroy ]
  
  def reply
    @object = ForumPost.reply( params )
    render_action1    
  end
  
end
