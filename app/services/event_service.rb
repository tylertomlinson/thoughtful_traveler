class EventService
  def event_by_genre(genre)
    json = event_json(genre)
    event = EventSerializer.new(json)
  end

  private

  def event_json(genre)
    response = conn.get('event') do |f|
      f.params['genre'] = genre
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:9292')
  end
end
