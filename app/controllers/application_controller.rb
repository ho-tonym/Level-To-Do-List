class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_logged_in, :logged_in?, :current_user_name, :current_user_level

  def logged_in?
    !!session[:user_id] && User.find(session[:user_id])
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def current_user_name
    current_user.name
  end

  def current_user_level
    if current_user
      current_user.level
    else
      0
    end
  end

  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end
