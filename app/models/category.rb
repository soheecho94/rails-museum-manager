class Category < ApplicationRecord
  has_many :artwork_categories
  has_many :artworks, through: :artwork_categories
end
