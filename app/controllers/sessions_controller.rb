class SessionsController < ApplicationController
  def new
  end

  def create
    login = Login.find_by(username: safe_params[:session][:username])
    @user = login.loginable
    if login && login.authenticate(safe_params[:session][:password])
      log_in(@user)
      if login.loginable_type == 'supervisor'
        redirect_to supervisor_dashboard_path #does not exist yet
      elsif login.loginable == 'manager'
        redirect_to manager_dashboard_path #does not exist yet
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
