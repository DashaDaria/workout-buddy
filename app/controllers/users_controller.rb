class UsersController < ApplicationController

  def show
    if current_user
      @user = User.new
    else
      redirect_to signup_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to user_workouts_path(@user)
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
