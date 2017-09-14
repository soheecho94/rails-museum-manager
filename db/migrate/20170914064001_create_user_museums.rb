class CreateUserMuseums < ActiveRecord::Migration[5.1]
  def change
    create_table :user_museuems do |t|
      t.integer :user_id
      t.integer :museum_id

      t.timestamps null: false
    end
  end
end
