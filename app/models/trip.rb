class Trip < ApplicationRecord
  has_many :trip_events, dependent: :destroy
  has_many :events, through: :trip_events
  belongs_to :user
end
