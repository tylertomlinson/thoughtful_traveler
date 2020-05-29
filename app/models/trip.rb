class Trip < ApplicationRecord
  has_many :user_trips, dependent: :destroy
  has_many :user, through: :user_trips
end
