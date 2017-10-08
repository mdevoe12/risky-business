class Api::V1::Supervisors::FlrasController < ApplicationController
  def index
    date = Date.parse(params[:date])
    tasks = Worker.find(params[:worker_id]).flras.where(created_at: (date.beginning_of_day..date.end_of_day))
    render json: tasks
  end

  def update
    flra = Flra.find(params[:id])
    flra.points = params[:points].to_i
    flra.super_risk_score = params[:risk].to_i
    flra.save!
    flra.calc_diff
  end
end
