class Rating < ApplicationRecord

  belongs_to :user
  belongs_to :course

  def content_with_author
    "#{self.content} - #{self.user.name.capitalize}"
  end

end
