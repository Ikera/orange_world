class Admins::UsersController < ApplicationController
  before_action :all_users, only: [:index, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  layout 'admins'

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to(admins_users_path)
    else
      render 'new'
    end
  end

  def show  
    @characters = @user.characters
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to(admins_users_path)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_users_url, notice: 'User was successfully destroyed.'  
  end

  private

  def all_users
    @users = User.all
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_id)
  end	
end
