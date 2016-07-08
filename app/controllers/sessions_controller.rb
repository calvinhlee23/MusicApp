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
      flash[:errors] = "already logged in"
    elsif user.nil?
      flash[:errors] = "email/password combination cannot be found"
    else
      login!(user)
      redirect_to bands_url
    end
  end

  def destroy
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
  end


end
