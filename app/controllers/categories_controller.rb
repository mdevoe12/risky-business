class CategoriesController < ApplicationController
  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end
end
