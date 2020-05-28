class UserTrip < ApplicationRecord
  belongs_to :user_id
  belongs_to :trip_id
end
