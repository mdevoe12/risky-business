class Api::V1::Supervisors::TasksController < ApplicationController
  def index
    date = Date.parse(params[:date])
    tasks = Worker.find(params[:worker_id]).tasks.where(created_at: (date.beginning_of_day..date.end_of_day))
    render json: tasks
  end

  def update
    task = Task.find(params[:id])
    task.update!(points: params[:points])
    render nothing: true, status: 201
  end
end
