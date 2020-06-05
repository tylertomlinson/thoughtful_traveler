class User::TripsController < User::BaseController
  def index; end

  def new; end

  def create
    begin
      trip = current_user.trips.create!(trip_params)
      trip.populate(selected_genres, trip_params)
      redirect_to edit_user_trip_path(trip)
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
    params.permit(:city, :state, :start_date, :end_date)
  end

  def genre_params
    params.permit(:indian, :mexican, :pizza, :italian, :american, :music,
                  :sports, :theater, :amusement_parks, :museums, :zoo)
  end

  def selected_genres
    genre_params.select { |_, value| value == '1' }.keys
  end

  def attraction_params
    params.permit(:music, :sports, :theater, :amusement_parks, :museums, :zoo)
  end
end
