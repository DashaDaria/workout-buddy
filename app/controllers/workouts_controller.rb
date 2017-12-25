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
    @user = current_user
    @workout = Workout.new(workout_params)
    @workout.user_id = @user.id
    if @workout.save
    redirect_to user_workouts_path
  else
    render 'new'
  end
  end


private
  def workout_params
  params.require(:workout).permit(:name)
  end

end
