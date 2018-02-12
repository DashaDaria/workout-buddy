class Users::WorkoutsController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      @workouts = @user.workouts
      filter
      respond_to do |format|
        format.html {render :index}
        format.json {render json: @workouts, status: 200}
      end
    else
      redirect_to '/'
    end
  end

  private
  def filter
    if params[:done] == "completed"
      @workouts = @user.workouts.done
    elsif params[:done] == "not completed"
      @workouts = @user.workouts.not_done
    else
      @workouts = @user.workouts
    end
  end
end
