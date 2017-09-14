class CreateArtworkCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_categories do |t|
      t.integer :artwork_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
