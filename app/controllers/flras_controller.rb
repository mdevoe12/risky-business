class FlrasController < ApplicationController
  def index
    if params[:q]
      if params[:q][:created_at_gteq].empty? || params[:q][:created_at_lteq].empty?
        flash.now[:danger] = 'Please enter a Start and End Date'
        @q = Flra.ransack(params[:q])
        @flras = []
      else
        if params[:q][:created_at_gteq].present?
          params[:q][:created_at_gteq] = params[:q][:created_at_gteq].to_date.beginning_of_day
        end
        if params[:q][:created_at_lteq].present?
          params[:q][:created_at_lteq] = params[:q][:created_at_lteq].to_date.end_of_day
        end
        @q = Flra.ransack(params[:q])
        @flras = @q.result.includes(:responses, :questions, :worker).order(:created_at)
      end
    else
      @q = Flra.ransack(params[:q])
      @flras = []
    end

  end

  def search
    index
    render :index
  end

  def show
    @flra = Flra.find(params[:id])
  end

  def update
    flra = Flra.find(params[:id])
    flra.update(flra_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def flra_params
    params.permit(:follow_up_status)
  end
end
