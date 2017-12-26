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
      flash[:notice] = "Cannot save, fix errors:"
      render 'new'
    end
  end

private
  def workout_params
  params.require(:workout).permit(:name, :completed, :exercise_ids => [],
    exercises_attributes: [
      :name,
      :length,
      :difficulty,
      :category_id,
      :how
    ])
  end

end
