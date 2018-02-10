class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @workout, status: 200}
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

  def edit
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
  end

  def update
    @workout = Workout.find(params[:id])
    # @workout.user_id = current_user.id
    if @workout.update(workout_params)
      redirect_to user_workouts_path(current_user)
    else
      flash[:notice] = "Cannot save, fix errors:"
      render 'edit'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    flash[:notice] = "Workout successfully deleted"
    redirect_to user_workouts_path(current_user)
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :completed,:exercise_ids => [],
      exercises_attributes: [
            :name,
            :length,
            :difficulty,
            :category_id,
            :how,
            :reps
          ])
  end
end
