class UserCommentSerializer < ActiveModel::Serializer
  attributes :id, :comments, :user_id
  belongs_to :artwork
end
