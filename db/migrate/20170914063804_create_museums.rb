class CreateMuseums < ActiveRecord::Migration[5.1]
  def change
    create_table :museums do |t|
      t.string :name
      t.text :description
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
