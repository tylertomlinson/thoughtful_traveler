class User < ApplicationRecord
  has_many :trips

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name ||= auth.info.name
      user.email = auth.info.email
      user.password_digest = SecureRandom.hex
      if !user.name
        user.name = auth.info.name
      end
    end
  end
end
