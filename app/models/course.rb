class Course < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :subject

end
