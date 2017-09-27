class AddCommentsToUserArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :user_artworks, :comments, :text
  end
end
