class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if logged_in?
      flash.now[:error] = "already logged in"
    elsif user.nil?
      flash.now[:error] = "email/password combination cannot be found"
    else
      log_in_user!
      flash.now[:json] = "welcome back!"
    end
    redirect_to user_url(user)
  end

  def destroy
    user = @current_user
    logout!(user)
    flash.now[:json] = "bye!"
    redirect_to #main page
  end

  private
  def logged_in?
    return true if @current_user
    false
  end

  def log_in_user!
    @current_user.reset_session_token!
    login!(@current_user)
  end

end
