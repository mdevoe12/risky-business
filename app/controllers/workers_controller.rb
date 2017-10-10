class WorkersController < ApplicationController

  def show
    @worker = Worker.find(params[:id])
  end

  def index
    @workers = current_user.workers_by_date((params[:date] if params[:date]) || Date.today)
  end
end
