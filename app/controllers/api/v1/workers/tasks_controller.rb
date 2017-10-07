class Api::V1::Workers::TasksController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    result = JSON.parse(response.request.body.string, symbolize_names: :true)

    task = Task.create!(description: result[:Task_Type],
                          worker_id: result[:worker_id],
                      supervisor_id: result[:supervisor_id],
                  worker_risk_score: result[:Risk_Level])
         task.responses.create(body: result[:Exact_Task])
         task.responses.create(body: result[:Risk_Concerns])
         task.responses.create(body: result[:description])
         task.responses.create(body: result[:Mitigation])

  end

end
