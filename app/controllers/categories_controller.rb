class CategoriesController < ApplicationController
  def edit
    @categories = Category.all
  end
end
