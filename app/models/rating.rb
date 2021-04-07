class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :course

  # All fields must be completed
  validates :stars, :content, presence: true

  def content_with_author
    "\"#{self.content}\" - #{self.user.name.capitalize}"
  end

  def self.filter(params)
    where("course_id = ?", params)
  end

end
