class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def edit
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.user_id = current_user.id
    if @workout.update(workout_params)
      redirect_to user_workouts_path(current_user)
    else
      flash[:notice] = "cannot save, try again"
      render 'new'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    flash[:notice] = "Workout successfully deleted"
    redirect_to user_workouts_path
  end

private
  def workout_params
  params.require(:workout).permit(:name, :checkbox_value, :exercise_ids => [])
  end

end
