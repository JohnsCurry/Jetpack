class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method  :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must be registered and logged in to do this, trust me it's worth it!"
      redirect_to register_path
    end
  end

  #def wrap(s, width=78)
  #  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1<br>").html_safe
  #end
end
