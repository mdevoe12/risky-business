class Api::V1::Supervisors::FollowupsController < ApplicationController
  def index
    render json: current_user.followup_flras
  end
end
