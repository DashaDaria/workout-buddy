class SessionsController < ApplicationController

  def new

    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to user_workouts_path(@user)
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
