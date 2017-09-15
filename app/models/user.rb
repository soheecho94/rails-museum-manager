# create_table :users do |t|
#   t.string :first_name
#   t.string :last_name
#   t.string :email
#   t.string :password_digest
#
#   t.timestamps null: false

class User < ApplicationRecord
  has_many :user_museums
  has_many :museums, through: :user_museums
  has_secure_password
end
