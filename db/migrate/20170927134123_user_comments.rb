class UserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.integer :artwork_id
      t.text :comments

      t.timestamps null: false
    end
  end
end
