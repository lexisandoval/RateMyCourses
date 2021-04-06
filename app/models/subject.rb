class Subject < ApplicationRecord

  has_many :courses

  scope :alpha, -> { order(:name) }
  
end
