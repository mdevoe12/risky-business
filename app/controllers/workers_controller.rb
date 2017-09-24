class WorkersController < ApplicationController

  def show
    @worker = Worker.find(params[:id])
    @tasks = @worker.tasks.where(points: nil)
  end

  def index
    @workers = current_user.workers
  end
end
