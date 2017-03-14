class RentMailer < ApplicationMailer
  default from: "Yo"
  def new_rent_mail(rent_id)
    @rent = Rent.includes(:user).find(rent_id)
    I18n.locale = @rent.user.locale
    mail to: @rent.user.email, subject: I18n.t('rents.mail_subject')
  end
end
