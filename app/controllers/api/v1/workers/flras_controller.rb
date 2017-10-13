class Api::V1::Workers::FlrasController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    result = JSON.parse(response.request.body.string, symbolize_names: :true)
    flra = Flra.create!(
                          worker_id: 1, #result[:workerId],
                      supervisor_id: result[:Supervisor],
                  worker_risk_score: result[:Risk_Level],
                        category_id: result[:Task_Type_Id])
         flra.responses.create(body: result[:Exact_Task], question_id: 1)
         flra.responses.create(body: result[:Specific_Risk], question_id: 2)
         flra.responses.create(body: result[:Specific_Concerns], question_id: 3)
         flra.responses.create(body: result[:Specific_Safety_Measures], question_id: 4)

  end

end
