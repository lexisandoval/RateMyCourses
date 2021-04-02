class Subject < ApplicationRecord

  scope :alpha, -> { order(:name) }
  
end
