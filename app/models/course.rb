class Course < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :subject

  def number_with_subject
    "#{self.subject.name} #{self.number}"
  end

  def full_title
    "#{number_with_subject} - #{self.title}"
  end

end
