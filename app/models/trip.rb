class Trip < ApplicationRecord
  has_many :trip_events, dependent: :destroy
  has_many :events, through: :trip_events
  belongs_to :user

  def populate(genres)
    event_list = EventService.new.events_by_genres(genres)
    event_list.each do |event|
      events << Event.create(event)
    end
  end

  def self.past_trips
    where('end_date < ?', 1.day.ago)
  end
end
