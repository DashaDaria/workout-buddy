class Workouts::ExercisesController < ApplicationController

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
    if @exercise.save
      render json: @exercise, status: 201
    else
      render json: @exercise.errors, status: 422
    end
  end

private
  def exercise_params
    params.require(:exercise).permit(:name, :length, :level, :category, :how, :reps, :workout_id)
  end
end
