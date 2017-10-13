class Api::V1::Workers::AverageController < ApplicationController
  def show
    worker = Worker.find(params[:id])

    render json: {average: worker.average_form_score}
  end
end
