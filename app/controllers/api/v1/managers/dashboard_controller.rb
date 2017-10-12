class Api::V1::Managers::DashboardController < ApplicationController

def index

  render json: {"flras": {"satisfactory" => Flra.where("points < ?", 3).count,
                "needs_improvement" => Flra.where("points >= ?", 3).count}}
end

end
