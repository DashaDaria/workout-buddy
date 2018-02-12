class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.uid = auth['uid']
      u.password = 'Temporary'
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    log_in @user
    redirect_to user_path(@user)
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
