class WorkoutsController < ApplicationController

  def index
    @user = current_user
    @workouts = @user.workouts
  end

end
