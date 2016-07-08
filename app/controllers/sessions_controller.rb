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
      login!(user)
      redirect_to bands_url
    end
  end

  def destroy
    user = @current_user
    logout!(user)
    flash.now[:json] = "bye!"
    redirect_to #main page
  end


end
