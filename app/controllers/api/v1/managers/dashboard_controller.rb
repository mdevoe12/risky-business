class Api::V1::Managers::DashboardController < ApplicationController

def index
  supervisors = Supervisor.all
  supervisor_stats = supervisors.map do |supervisor|
    {
      "Name": "#{supervisor.first_name}",
      "Reviewed": Flra.where(supervisor_id: supervisor.id).where("super_risk_score > ?", 0).count,
      "Outstanding": Flra.where(supervisor_id: supervisor.id).where(super_risk_score: nil).count
      }
  end

  render json: {"flras": {"satisfactory" => Flra.where("points < ?", 3).count,
                "needs_improvement" => Flra.where("points >= ?", 3).count},
                "supervisors": supervisor_stats}
end

end
