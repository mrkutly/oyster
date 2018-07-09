class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    byebug
    session.delete :user_id
    redirect_to login_path
  end
end