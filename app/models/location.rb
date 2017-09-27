class Location < ApplicationRecord
  has_many :museums, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
