class ArtworkCategory < ApplicationRecord
  belongs_to :artwork
  belongs_to :category
end
