class RentMailer < ApplicationMailer
  default from: Rails.application.secrets.mailer_user
  def new_rent_mail(rent)
    @rent = rent
    mail to: rent.user.email, subject: 'hola che!'
  end
end
