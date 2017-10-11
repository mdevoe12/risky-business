class SessionsController < ApplicationController
  def new
  end

  def create
    login = Login.find_by(username: safe_params[:session][:username])
    @user = login.loginable
    if login && login.authenticate(safe_params[:session][:password])
      log_in(@user, login)
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def safe_params
    params.permit(:session => {})
  end
end
