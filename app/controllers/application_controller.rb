class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# Set up sessions for logged-in users authorisation
# Set up admin for higher level authorisation

  before_action :fetch_user

  private
  helper_method :current_user, :logged_in, :admin_user

  def current_user
    @current_user ||= User.find_by :id => session[:user_id] if session[:user_id].present?
  end

  def fetch_user
    current_user
    session[:user_id] = nil unless @current_user.present?
  end

  def logged_in?
    current_user
  end

  def require_user
    if !logged_in?
    redirect_to root_path
    end
  end

  def admin_user
    current_user.admin
  end

  def require_admin
    if !admin_user
    redirect_to root_path
    end
  end

end
