# create_table :museums do |t|
#   t.string :name
#   t.text :description
#   t.integer :location_id
#
#   t.timestamps null: false

class Museum < ApplicationRecord
  belongs_to :location
  has_many :artworks
  has_many :user_museums
  has_many :users, through: :user_museums
end
