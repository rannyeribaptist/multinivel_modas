class PurchaseMailer < ApplicationMailer

  def notify_change
    @user = params[:user]
    @url = params[:url]
    @purchase = params[:purchase]

    attachments.inline['logo-horizontal.png'] = File.read('app/assets/images/logo-horizontal.png')

    mail(
      :to => @user.email,
      :subject => 'Sua compra no multinível da moda',
    )
  end
end
