class Trip < ApplicationRecord
  has_many :trip_events, dependent: :destroy
  has_many :events, through: :trip_events
  belongs_to :user

  def populate(genres)    
    EventService.new.events_by_genres(genres)
  end
end
