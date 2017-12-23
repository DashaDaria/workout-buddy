class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Thank you for signing up!"
      redirect_to user_workouts_path(@user)
    else
      flash.now[:danger] = "Input not valid"
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
