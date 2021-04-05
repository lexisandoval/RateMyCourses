class Course < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :subject

  # All fields must be completed
  validates :subject_id, :number, :title, :description, presence: true
  # Course number must be a 3 digit integer 
  validates :number, length: { is: 3}
  validates :number, numericality: { only_integer: true }
  # Course title cannot already exist and must be between 3 and 25 characters long
  validates :title, length: { in: 3..150 }
  # Course description must be between 10 and 100 characters long
  validates :description, length: { in: 10..750 }

  scope :alpha_subject, -> { includes(:subject).order('subjects.name ASC') }

  def number_with_subject
    "#{self.subject.name} #{self.number}"
  end

  def full_title
    "#{number_with_subject} - #{self.title}"
  end

end
