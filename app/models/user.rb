class User < ApplicationRecord

  has_many :ratings
  has_many :courses, through: :ratings

  validates :username, :name, presence: true
  has_secure_password
  
end
