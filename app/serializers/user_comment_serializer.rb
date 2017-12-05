class UserCommentSerializer < ActiveModel::Serializer
  attributes :id, :comments, :user_id, :username, :artwork_id
  belongs_to :artwork
  belongs_to :user
end
