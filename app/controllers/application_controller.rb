class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :authorize!

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize!
    permission = Permission.new(current_user, params[:controller], params[:action], params[:id])
    redirect_to root_path unless permission.authorized?
  end
end
