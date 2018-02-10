class Users::WorkoutsController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      filter_workouts_view
    else
      redirect_to '/'
    end
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
