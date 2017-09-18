class Category < ApplicationRecord
  has_many :artwork_categories
  has_many :artworks, through: :artwork_categories

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.alphabetical
    order('name ASC')
  end
end
