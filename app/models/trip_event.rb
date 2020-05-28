class TripEvent < ApplicationRecord
  belongs_to :trip_id
  belongs_to :event_id
end
