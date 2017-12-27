class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    @categories = Category.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end
end
