class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @exercises = @category.exercises
  end

end
