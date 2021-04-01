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
    where("subject_id = ?", params)
  end

  def subject_attributes=(attr)
    self.subject = Subject.find_or_create_by(attr) if !attr[:name].blank?
  end

end
