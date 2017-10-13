class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user
  # before_action :authorize!

  def log_in(user, login)
    session[:user_id] = user.id
    session[:role] = login.loginable_type
  end

  def current_user
    if session[:role] == "Supervisor"
      @current_user ||= Supervisor.find_by(id: session[:user_id])
    else
      @current_user ||= Manager.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize!
    permission = Permission.new(current_user, params[:controller], params[:action], params[:id])
    redirect_to root_path unless permission.authorized?
  end
end
