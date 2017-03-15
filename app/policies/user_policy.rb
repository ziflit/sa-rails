class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    record.id == user.id
  end

  def rents_index?
    record.id == user.id
  end
end
