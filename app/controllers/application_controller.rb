class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :auth?

  def auth?
    return true if current_user
    false
  end

  def log_in?
    redirect_to log_in_url if not auth?
  end

  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      @current_user = nil
    end
  end
end
