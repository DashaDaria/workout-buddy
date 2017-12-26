class Users::WorkoutsController < ApplicationController

  def index
    @user = current_user
    @workouts = @user.workouts
  end

  def new
    @workout = Workout.new
    @exercises = Exercise.all
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    if @workout.save
      redirect_to user_workouts_path
    else
      flash[:notice] = "cannot save, try again"
      render 'new'
    end
  end

private
  def workout_params
  params.require(:workout).permit(:name,:checkbox_value, :exercise_ids => [])
  end

end
