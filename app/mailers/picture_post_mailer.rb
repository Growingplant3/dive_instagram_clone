class PicturePostMailer < ApplicationMailer
  def thanks_mail(picture)
    @picture = picture
    mail(to: @picture.user.email, subject: "ご投稿ありがとうございます。")
  end
end
