class User::TripsController < User::BaseController
  def index
    unless current_user
      flash[:notice] = 'You must sign in to create a trip'
      redirect_to '/login'
    end
  end

  def new; end

  def create
    begin
      current_user ? user_redirect_new_trip_events(selected_genres) : sign_in_to_create
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

  def user_redirect_new_trip_events(genres)
    trip = current_user.trips.create!(trip_params)
    redirect_to new_user_trip_event_path(trip.id, genres)
    binding.pry
  end

  def sign_in_to_create
    flash[:notice] = 'You must sign in to create a trip'
    redirect_to '/user/trips/new'
  end

  def selected_genres
    { genres: genre_params.select { |key, value| value == "1" }.keys }
  end
end
