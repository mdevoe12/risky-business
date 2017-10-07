class FollowupsController < ApplicationController
  def index
    @flras = current_user.followup_flras
  end
end
