class Location < ApplicationRecord
  has_many :museums

  validates :name, presence: true
  validates :name, uniqueness: true
end
