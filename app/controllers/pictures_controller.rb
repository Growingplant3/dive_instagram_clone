class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit destroy]

  def index
    @pictures = Picture.all.order(created_at: "desc")
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save(picture_params)
      flash[:notice] = "コメント/画像の登録が成功しました。"
      redirect_to pictures_path
    else
      flash.now[:danger] = "コメント/画像の登録が失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @picture.destroy
    flash[:notice] = "コメント/画像を削除しました。"
    redirect_to pictures_path
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, :user_id)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
