class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  def login_required
    redirect_to '/login' unless logged_in?
  end

  def logged_in?
    true if current_user
  end
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  helper_method :logged_in?
end
