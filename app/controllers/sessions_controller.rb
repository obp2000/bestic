# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
#  include AuthenticatedSystem
  
  def new
    render :template => "sessions/new"
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token,
                  :expires => self.current_user.remember_token_expires_at }
      end
#      flash.now[:notice] = "Вход успешно выполнен."
      redirect_back_or_default('/')
    else
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
#    flash.now[:notice] = "Выход успешно выполнен."
    redirect_back_or_default('/')
  end
  
  def forgot_password 
    return unless request.post? 
    if @user = User.find_by_email(params[:email]) 
      @user.forgot_password 
      @user.save 
      flash.now[:notice] = User.forgot_password_notice
    else
      flash.now[:notice] = User.user_not_found_notice
    end
    render :template => "sessions/forgot_password_notice.rjs"
  end
  
  def reset_password 
    @page_title = @user.reset_password_page_title
    @user = User.find_by_pw_reset_code(params[:id]) rescue nil 
    unless @user 
      render(:text => "Not found", :status => 404) 
      return 
    end 
    return unless request.post? 
    if @user.update_attributes(params[:user]) 
      @user.reset_password 
      flash[:notice] = @user.reset_password_notice
      redirect_back_or_default('/') 
    end
  end
    
end
