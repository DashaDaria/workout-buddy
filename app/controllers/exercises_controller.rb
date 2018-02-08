class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    @categories = Category.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def body
    @exercise = Exercise.find(params[:id])
    render json: @exercise.to_json
    end
end
