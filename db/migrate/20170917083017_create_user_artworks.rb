class CreateUserArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_artworks do |t|
      t.integer :user_id
      t.integer :artwork_id

      t.timestamps null: false
    end
  end
end
