class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :course

  validates :course_id, presence: true
  validates :stars, presence: true
  validates :content, presence: true

  def content_with_author
    "#{self.content} - #{self.user.name.capitalize}"
  end

  def self.filter(params)
    where("course_id = ?", params)
  end

end
