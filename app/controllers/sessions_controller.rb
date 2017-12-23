class SessionsController < ApplicationController

  def new

    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_workouts_path(@user)
    else
      flash[:alert] = "Invalid email/password combination"
      redirect_to signup_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
