class User < ApplicationRecord

  has_many :ratings
  has_many :courses, through: :ratings

  # All fields must be completed
  validates :username, :name, presence: true
  # Username cannot already be taken
  validates :username, uniqueness: true
  has_secure_password

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['first_name']
      u.username = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end

end
