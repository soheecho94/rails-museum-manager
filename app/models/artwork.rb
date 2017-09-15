# create_table :artworks do |t|
#   t.string :title
#   t.string :artist
#   t.integer :year
#   t.text :description
#   t.integer :museum_id
#
#   t.timestamps null: false

class Artwork < ApplicationRecord
  belongs_to :museum
  has_many :artwork_categories
  has_many :categories, through: :artwork_categories
end
