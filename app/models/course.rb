class Course < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :subject

  def title_with_number
    "#{self.number} - #{self.title}"
  end

end
