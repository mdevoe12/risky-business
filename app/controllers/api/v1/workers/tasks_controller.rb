class Api::V1::Workers::TasksController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    result = JSON.parse(response.request.body.string, symbolize_names: :true)

    flra = Flra.create!(description: result[:Task_Type],
                          worker_id: result[:worker_id],
                      supervisor_id: result[:supervisor_id],
                  worker_risk_score: result[:Risk_Level])
         flra.responses.create(body: result[:Exact_Task], question_id: 1)
         flra.responses.create(body: result[:Risk_Concerns], question_id: 2)
         flra.responses.create(body: result[:description], question_id: 3)
         flra.responses.create(body: result[:Mitigation], question_id: 4)
  end

end
