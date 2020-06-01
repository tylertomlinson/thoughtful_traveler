class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true

  has_many :trip_events, dependent: :destroy
  has_many :trips, through: :trip_events
end
