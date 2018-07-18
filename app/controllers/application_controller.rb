class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def require_logged_in
    redirect_to controller: 'static', action: 'index' unless current_user
  end
end
