class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @users = User.all
    @magazine = Magazine.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @magazine = Magazine.new
    @magazines = @user.magazines
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile)
  end
end
