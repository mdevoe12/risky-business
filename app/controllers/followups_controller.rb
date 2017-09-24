class FollowupsController < ApplicationController
  def index
    @tasks = current_user.followup_tasks
  end
end
