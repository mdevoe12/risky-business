class Api::V1::Supervisors::TaskScoresController < ApplicationController
  def index
    render json: Supervisor.find(params[:id]).flra_score_counts
  end
end
