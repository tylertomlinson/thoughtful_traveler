class TripPreference < ApplicationRecord
  belongs_to :trip_id
  belongs_to :preference_id
end
