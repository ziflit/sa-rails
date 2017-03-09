class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rents

  validates :email, presence: true, uniqueness: true
  before_validation :generate_verification_code, on: :create
  has_many :rents

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end
end
