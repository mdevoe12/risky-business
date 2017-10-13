class Api::V1::Workers::TaskScoresController < ApplicationController
  def index
    render json: Worker.find(params[:id]).flra_score_counts
  end
end
