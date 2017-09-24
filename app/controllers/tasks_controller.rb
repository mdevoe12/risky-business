class TasksController < ApplicationController
  def index
    @tasks = Task.most_recent
  end
end
