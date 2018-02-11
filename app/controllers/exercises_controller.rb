class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @exercise, status: 200}
    end
  end


end
