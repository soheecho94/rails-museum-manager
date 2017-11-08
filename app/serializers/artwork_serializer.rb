class ArtworkSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :year, :description
  belongs_to :museum
end
