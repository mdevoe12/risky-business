class SessionsController < ApplicationController
  def new
  end

  def create
    login = Login.find_by(username: safe_params[:session][:username])
    @user = login.loginable
    if login && login.authenticate(safe_params[:session][:password])
      log_in(@user)
      if login.loginable_type == 'Supervisor'
        redirect_to dashboard_path
      elsif login.loginable == 'Manager'
        redirect_to managers_dashboard_path
      else
        redirect_to root_path
      end
    end
  end

  private

  def safe_params
    params.permit(:session => {})
  end
end
