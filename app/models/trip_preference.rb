class TripPreference < ApplicationRecord
  belongs_to :trip
  belongs_to :preference
end
