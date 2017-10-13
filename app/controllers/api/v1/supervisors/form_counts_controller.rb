class Api::V1::Supervisors::FormCountsController < ApplicationController
  def index
    supervisor = Supervisor.find(params[:id])
    render json: supervisor.form_counts
  end
end
