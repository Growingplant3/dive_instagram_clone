class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    flash[:notice] = "#{favorite.picture.user.email}さんの投稿をお気に入り登録しました。"
    redirect_to pictures_path
  end

  def destroy
    favorite = current_user.favorites.find(params[:id]).destroy
    flash[:danger] = "#{favorite.picture.user.email}さんの投稿をお気に入り解除しました。"
    redirect_to pictures_path
  end

  def index
    @favorites = current_user.favorites
  end
end
