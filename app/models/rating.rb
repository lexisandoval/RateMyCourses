class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :course

  # All fields must be completed
  validates :course_id, :stars, :content, presence: true
  # User can only rate a course once
  validates :course_id, uniqueness: true

  def content_with_author
    "\"#{self.content}\" - #{self.user.name.capitalize}"
  end

  def self.filter(params)
    where("course_id = ?", params)
  end

end
