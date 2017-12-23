class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_workouts_path(@user)
    else
      flash[:alert] = "Can't find user"
      redirect_to signup_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
