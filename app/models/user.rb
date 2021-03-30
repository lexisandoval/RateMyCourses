class User < ApplicationRecord

  has_many :ratings
  has_many :courses, through: :ratings

  has_secure_password
  
end
