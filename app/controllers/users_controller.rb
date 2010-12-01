class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
#  include AuthenticatedSystem
  
  def new
#    @user = User.new
    render :action => "new", :layout => false
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      reset_session
      redirect_back_or_default('/')
      flash[:notice] = @user.new_user_notice
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:id].blank? ? false : User.find_by_activation_code(params[:id])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = current_user.activate_user_notice
    end
    redirect_back_or_default('/')
  end

end
