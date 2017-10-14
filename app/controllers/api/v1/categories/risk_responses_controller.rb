class Api::V1::Categories::RiskResponsesController < ApplicationController
  def index
    render json: Category.find(params[:id]).recent_risk_responses
  end
end
