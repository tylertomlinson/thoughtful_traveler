class User::TripsController < User::BaseController
  def index; end

  def new; end

  def create
    begin
    trip = current_user.trips.create!(trip_params)
    redirect_to new_user_trip_event_path(selected_genres.merge(trip_id: trip.id))
    rescue ActiveRecord::RecordInvalid
      flash[:error] = errors.messages
      render new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.permit(:location, :start_date, :end_date)
  end

  def genre_params
    params.permit(:indian, :mexican, :pizza, :italian, :american, :music,
                  :sports, :theater, :amusement_parks, :museums, :zoo)
  end

  def selected_genres
    # require "pry"; binding.pry
    { genres: genre_params.select { |key, value| value == "1" }.keys,
      trip_id: params[:id]}
  end

  def attraction_params
    params.permit(:music, :sports, :theater, :amusement_parks, :museums, :zoo)
  end
end
