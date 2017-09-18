# create_table :users do |t|
#   t.string :first_name
#   t.string :last_name
#   t.string :email
#   t.string :password_digest
#
#   t.timestamps null: false

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_artworks
  has_many :artworks, through: :user_artworks

  def username
    self.email.split("@")[0]
  end

  def self.most_artworks
    
  end
end
