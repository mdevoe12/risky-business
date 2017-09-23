class WorkersController < ApplicationController
  def show
    @worker = Worker.find(params[:id])
    @tasks = @worker.tasks_by_date(Date.today)
  end
end
