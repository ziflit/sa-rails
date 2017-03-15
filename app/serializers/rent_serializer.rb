class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to
  has_one :book
  has_one :user
end
