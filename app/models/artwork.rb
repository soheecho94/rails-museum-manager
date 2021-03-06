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

  has_many :user_artworks, dependent: :destroy
  has_many :users, through: :user_artworks
  
  has_many :user_comments, dependent: :destroy
  has_many :comments, through: :user_comments

  def museum_name=(name)
    self.museum = Museum.find_or_create_by(name: name)
  end

  def museum_name
    if self.museum
      self.museum
    end
  end

  def categories_attributes=(attributes_hash)
    if attributes_hash["0"]["name"].strip != ""
      attributes_hash.values.each do |attribute|
        category = Category.find_or_create_by(attribute)
        self.categories << category
      end
    end
  end

end
