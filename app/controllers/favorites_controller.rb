class FavoritesController < ApplicationController
  def create
    @magazines = Magazine.find_by(id: params[:magazine_id])
    @favorite = Favorite.new(magazine_id: @magazines.id)
    @favorite.user_id = current_user.id
    @favorite.save

  end

  def destroy
    @magazines = Magazine.find_by(id: params[:magazine_id])
    @favorite = Favorite.find_by(magazine_id: @magazines.id)
    @favorite.destroy
  end

end
