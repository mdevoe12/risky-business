class Api::V1::Categories::ControlsController < ApplicationController
  def index
    render json: Category.find(params[:id]).controls
  end

  def create
    Category.find(params[:id]).controls.create(control_params)
  end

  private

  def control_params
    params.permit(:body)
  end
end
