class Admins::UsersController < ApplicationController
  before_action :all_users, only: [:index, :destroy]
  before_action :set_user, only: [:show, :destroy]
  before_action :authenticate_admin!

  layout 'admins'

  def index
  end

  def show  
    @characters = @user.characters
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
    params.require(:user).permit(:username, :user_id)
  end	
end
