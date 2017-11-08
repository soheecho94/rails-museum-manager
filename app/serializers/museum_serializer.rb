class MuseumSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :artworks
end
