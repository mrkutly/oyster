class UsersController < ApplicationController
  before_action :authorized, except: [:new, :create, :welcome]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to welcome_path(@user)
    else
      render :new
    end
  end

  def welcome
    set_user
  end

  def show
    set_user
  end

  def destroy
    set_user
    @user.destroy
  end

  def edit
    set_user
  end

  def update
    set_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
