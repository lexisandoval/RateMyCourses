class User < ApplicationRecord

  has_many :ratings
  has_many :courses, through: :ratings

  # All fields must be completed
  validates :username, :name, presence: true
  # Username cannot already be taken
  validates :username, uniqueness: true
  has_secure_password
  
end
