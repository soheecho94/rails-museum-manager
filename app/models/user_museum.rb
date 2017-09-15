class UserMuseum < ApplicationRecord
  belongs_to :museum
  belongs_to :user
end
