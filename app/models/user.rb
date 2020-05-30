class User < ApplicationRecord
  validates :user_name, presence: true
  validates :password_digest, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :trips, dependent: :destroy

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name ||= auth.info.name
      user.email = auth.info.email
      user.password_digest = SecureRandom.hex
      unless user.name
        user.name = auth.info.name
      end
    end
  end
end
