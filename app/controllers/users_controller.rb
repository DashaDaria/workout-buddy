class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Thank you for signing up!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Input not valid"
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to '/'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
