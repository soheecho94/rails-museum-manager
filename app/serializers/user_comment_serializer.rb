class UserCommentSerializer < ActiveModel::Serializer
  attributes :id, :comments
  belongs_to :artwork
end
