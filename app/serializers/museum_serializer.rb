class MuseumSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location_id
  has_many :artworks
end
