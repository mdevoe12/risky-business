class FlrasController < ApplicationController
  def index
    @flras = Flra.most_recent
  end
end
