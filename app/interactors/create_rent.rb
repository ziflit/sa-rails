class CreateRent
  include Interactor

  def call
    rent = Rent.new(context.params)
    rent.user = context.user
    if rent.save
      RentMailer.delay.new_rent_mail(rent.id)
    else
      context.fail!
    end
  end
end
