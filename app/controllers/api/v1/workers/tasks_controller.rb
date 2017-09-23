class Api::V1::Workers::TasksController < ApplicationController

  def create

    task = Task.create!(description: params[:task_description],
                 worker_id: params[:worker_id],
                 supervisor_id: params[:supervisor_id])
    params[:questions].each do |q, a|
      task.responses.create!(body: "#{a}", question_num: q.to_i)
    end

  end

end
