class SessionsController < ApplicationController
  def new
  end

  def create
    login = Login.find_by(username: params[:session][:username])
    if login && login.authenticate(params[:session][:password])
      log_in(login)
      if login.role == 'supervisor'
        redirect_to supervisor_dashboard_path
      else
        redirect_to manager_dashboard_path
      end
    end
  end

  private

  def safe_params
    params.require(:login).permit(:session)
  end
end
