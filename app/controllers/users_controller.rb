class UsersController < ApplicationController
  before_action :authorized, except: [:create, :welcome]

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path(@user)
    else
      render 'sessions/new'
    end
  end

  def welcome
    current_user
  end

  def home
    current_user
    @trip = Trip.new
    @trips = @user.trips
  end

  def destroy
    current_user
    @user.delete_account
    session.delete :user_id
    redirect_to login_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
