class WorkoutsController < ApplicationController

  def index
    @user = current_user
    @workouts = @user.workouts
  end

  def new
    @workout = Workout.new
    @exercises = Exercise.all
  end

  def create

    @workout = Workout.create(workout_params)
    redirect_to user_workouts_path(current_user)
  end


private
  def workout_params
  params.require(:workout).permit(:name,:status)
  end

end
