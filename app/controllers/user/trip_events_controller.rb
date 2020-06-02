class User::TripEventsController < User::BaseController
  def new
    genres = params[:genres]
    trip_id = params[:trip_id]
  end

  def update
    trip_event = TripEvent.find(params[:id])
    old_event = Event.find(trip_event.event_id)
    new_event = EventService.new.event_by_genre(old_event.genre)
    old_event.update(new_event.params)

    redirect_to edit_user_trip_path(trip_event.trip)
  end
end
