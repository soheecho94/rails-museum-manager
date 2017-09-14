class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.text :description
      t.integer :museum_id

      t.timestamps null: false
    end
  end
end
