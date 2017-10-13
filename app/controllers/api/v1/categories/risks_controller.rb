class Api::V1::Categories::RisksController < ApplicationController
  def index
    render json: Category.find(params[:id]).top_risks
  end
end
