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

  accepts_nested_attributes_for :location

  def location_attributes=(attributes_hash)
    if attributes_hash["name"].strip != ""
      attributes_hash.values.each do |attribute|
        location = Location.find_or_create_by(name: attribute)
        self.location = location
      end
    end
  end

  def self.alphabetical
    order('name ASC')
  end

  def self.most_artworks
    joins(:artworks).group(:id).order("count(*) DESC").limit(3)
    # SELECT  "museums".*
    # FROM "museums"
    # INNER JOIN "artworks"
    # ON "artworks"."museum_id" = "museums"."id"
    # GROUP BY "museums"."id"
    # ORDER BY count(*) DESC
    # LIMIT ?  [["LIMIT", 1]]
  end
end
