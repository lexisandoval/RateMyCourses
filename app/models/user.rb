class User < ApplicationRecord

  has_many :ratings
  has_many :courses, through: :ratings
  
end
