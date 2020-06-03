class EventService
  def event_by_genre(genre)
    json = event_json(genre)
    EventSerializer.new(json)
  end

  def events_by_genres(genres)
    response = conn.get('events') do |f|
      f.params['genres'] = genres.join(',')
    end
    json = JSON.parse(response.body, symbolize_names: true)
    EventSerializer.events_from(json)
  end

  private

  def event_json(genre)
    response = conn.get('event') do |f|
      f.params['genre'] = genre
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:9292')
  end
end
