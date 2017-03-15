class SimpleBookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :year, :publisher, :image
end
