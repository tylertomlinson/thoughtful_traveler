class EventSerializer
  attr_reader :genre, :name, :location, :date

  def initialize(json)
    @genre = json[:genre]
    @name = json[:name]
    @location = json[:location]
    @date = json[:date]
  end

  def self.events_from(events_json)
    response = []
    events_json[:genres].each do |events|
      response << events[1][0]
    end
    response
  end

  def params
    { genre: @genre, name: @name, location: @location, date: @date }
  end
end
