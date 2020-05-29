class ApplicationController < ActionController::Base
  helper_method :current_user, :require_current_user

  def current_user
    user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    render file: "/public/404" unless current_user
  end
end
