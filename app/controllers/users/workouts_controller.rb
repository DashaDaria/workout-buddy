class Users::WorkoutsController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      filter_workouts_view
    else
      redirect_to '/'
    end
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    if @workout.save
      redirect_to user_workouts_path(current_user)
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
        :how,
        :reps
      ]
    )
  end

  def filter_workouts_view
    if params[:done] == "completed"
      @workouts = @user.workouts.done
    elsif params[:done] == "not completed"
      @workouts = @user.workouts.not_done
    else
      @workouts = @user.workouts
    end
  end
end
