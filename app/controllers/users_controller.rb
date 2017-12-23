class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for signing up!"
      redirect_to user_workouts_path
    else
      flash[:alert] = "Input not valid"
      redirect_to signup_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
