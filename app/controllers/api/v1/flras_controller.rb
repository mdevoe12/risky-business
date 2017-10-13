class Api::V1::FlrasController < ApplicationController
  def update
    flra = Flra.find(params[:id])
    flra.update(flra_params)
  end

  private
    def flra_params
      params.require(:flra).permit(:follow_up_status)
    end
end
