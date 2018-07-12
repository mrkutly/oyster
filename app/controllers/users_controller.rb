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
    set_user
  end

  def home
    set_user
    @trip = Trip.new
    @trips = @user.trips
  end

  def destroy
    delete_user
    session.delete :user_id
    redirect_to login_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def delete_user
    set_user
    @user.photos.destroy_all
    @user.journal_entries.destroy_all
    @user.photo_albums.destroy_all
    @user.trips.destroy_all
    @user.delete
  end

end
