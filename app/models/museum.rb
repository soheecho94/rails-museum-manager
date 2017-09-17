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

  def location_name=(name)
    self.location = Location.find_or_create_by(name: name)
  end

  def location_name
    if self.location
      self.location
    end
  end
end
