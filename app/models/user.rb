class User < ApplicationRecord
  has_many :user_trips, dependent: :destroy
  has_many :trips, through: :user_trips
end
