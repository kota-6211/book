class FavoritesController < ApplicationController
  def create
    magazine = Magazine.find_by(id: params[:magazine_id])
    favorite = Favorite.new(magazine_id: magazine.id)
    favorite.user_id = current_user.id
    favorite.save
    redirect_to magazine_path(magazine)
  end

  def destroy
    magazine = Magazine.find_by(id: params[:magazine_id])
    favorite = Favorite.find_by(magazine_id: magazine.id)
    favorite.destroy
    redirect_to magazine_path(magazine)
  end

end
