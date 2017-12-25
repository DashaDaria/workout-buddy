class CategoriesController < ApplicationController

  def index
    @category = Category.find(params[:id])
    @exercises = @category.exercises
  end

end
