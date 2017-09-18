# create_table :museums do |t|
#   t.string :name
#   t.text :description
#   t.integer :location_id
#
#   t.timestamps null: false

class Museum < ApplicationRecord
  belongs_to :location
  has_many :artworks, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  def location_name=(location_name)
    if location_id == ""
      self.location = Location.find_or_create_by(name: location_name)
    end
  end

  def location_name
    if self.location
      self.location
    end
  end
end
