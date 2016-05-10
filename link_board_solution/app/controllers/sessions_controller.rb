class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate params[:user][:email], params[:user][:password]

    if user
      session[:user_id] = user.id
      flash[:success] = 'You are now logged in'
      redirect_to root_path
    else
      flash[:danger] = 'Username and/or password incorrect'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been logged out'
    redirect_to root_path
  end
end
