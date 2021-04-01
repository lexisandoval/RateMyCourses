class Course < ApplicationRecord

  has_many :ratings
  has_many :users, through: :ratings
  belongs_to :subject

  validates :subject_id, :number, :title, :description, presence: true
  validates :number, length: { is: 3}
  validates :number, numericality: { only_integer: true }
  validates :title, length: { in: 3..25 }
  validates :title, uniqueness: true
  validates :description, length: { in: 10..100 }


  def number_with_subject
    "#{self.subject.name} #{self.number}"
  end

  def full_title
    "#{number_with_subject} - #{self.title}"
  end

end
