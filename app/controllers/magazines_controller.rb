class MagazinesController < ApplicationController
  def index
    @magazines = Magazine.all
    @magazine = Magazine.new
  end

  def show
    @magazines = Magazine.find_by(id: params[:id])
    @magazine = Magazine.new
    @user = @magazines.user
    @comment = Comment.new
  end

  def create
    @magazine = Magazine.new(magazine_params)
    @magazine.user_id = current_user.id
    @magazine.save
    redirect_to magazines_path
  end

  def edit
    @magazine = Magazine.find_by(id: params[:id])
  end

  def update
    @magazine = Magazine.find_by(id: params[:id])
    @magazine.update(magazine_params)
    redirect_to magazine_path(@magazine)
  end

  def destroy
    @magazine = Magazine.find_by(id: params[:id])
    @magazine.destroy
    redirect_to magazines_path
  end

  private

  def magazine_params
    params.require(:magazine).permit(:title, :body)
  end
end
