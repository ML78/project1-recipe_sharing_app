class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :fetch_user

  private

  helper_method :current_user, :logged_in

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

end
