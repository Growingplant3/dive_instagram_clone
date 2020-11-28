class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  before_action :unauthorized_user, only: %i[edit update destroy]

  def index
    flash[:notice] = "indexを通過"
    @pictures = Picture.all.order(created_at: "desc")
  end

  def new
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save(picture_params)
        PicturePostMailer.thanks_mail(@picture).deliver
        flash[:notice] = "コメント/画像の登録が成功しました。"
        redirect_to pictures_path
      else
        flash.now[:danger] = "コメント/画像の登録が失敗しました。"
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      flash[:notice] = "コメント/画像の編集が成功しました。"
      redirect_to picture_path(@picture)
    else
      flash[:notice] = "コメント/画像の編集が失敗しました。"
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = "コメント/画像を削除しました。"
    redirect_to pictures_path
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache, :user_id)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
