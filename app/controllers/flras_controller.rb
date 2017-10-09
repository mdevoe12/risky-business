class FlrasController < ApplicationController
  def index
    @flras = Flra.most_recent
  end

  def show
    @flra = Flra.find(params[:id])
  end

  def update
    flra = Flra.find(params[:id])
    flra.update(flra_params)
    redirect_to flra
  end

  private

  def flra_params
    params.permit(:follow_up_status)
  end
end
