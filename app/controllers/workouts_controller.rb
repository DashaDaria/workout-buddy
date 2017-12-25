class WorkoutsController < ApplicationController

  def index
    @user = current_user
    @workouts = @user.workouts
  end

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
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

  def edit
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def update
    @workout = Workout.new(workout_params)
    binding.pry
    @workout.user_id = current_user.id
    if @workout.save
      redirect_to user_workouts_path
    else
      flash[:notice] = "cannot save, try again"
      render 'new'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    flash[:notice] = "successfully deleted"
    redirect_to user_workouts_path
  end

private
  def workout_params
  params.require(:workout).permit(:name)
  end

end
