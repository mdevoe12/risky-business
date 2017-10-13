class Api::V1::Workers::FormCountsController < ApplicationController
  def index
    worker = Worker.find(params[:id])
    render json: worker.form_counts(params[:super_id])
  end
end
