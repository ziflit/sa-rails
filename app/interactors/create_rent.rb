class CreateRent
  include Interactor

  def call
    rent = Rent.new(context.params)
    rent.user = context.user
    context.fail!(error: rent.errors.messages) unless rent.save
    RentMailer.delay.new_rent_mail(rent.id)
  end
end
