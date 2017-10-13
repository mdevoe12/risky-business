class Api::V1::Categories::RisksController < ApplicationController
  def index
    render json: Category.find(params[:id]).top_risks
  end

  def create
    Category.find(params[:id]).top_risks.create(risk_params)
  end

  private

  def risk_params
    params.permit(:body)
  end
end
