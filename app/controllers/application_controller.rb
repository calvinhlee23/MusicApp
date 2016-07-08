class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil if @current_user.nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def log_in_user!
    @current_user.reset_session_token!
    login!(@current_user)
  end

  def logout!(user)
    user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end

  def logged_in?
    return true unless @current_user.nil?
    false
  end

  def login_permission
    if session[:session_token].nil?
      redirect_to new_sessions_url
    end
  end

end
