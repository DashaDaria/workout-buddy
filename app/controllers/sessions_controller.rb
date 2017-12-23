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

  def facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    log_in @user

    redirect_to user_workouts_path(@user)
  end

  def destroy
    log_out
    redirect_to login_path
  end

private
  def auth
    request.env['omniauth.auth']
  end
end
