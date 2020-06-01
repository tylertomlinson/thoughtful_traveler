class User::TripsController < User::BaseController
  def index
    if current_user == nil
      flash[:notice] = 'You must sign in to create a trip'
      redirect_to '/login'
    end
  end

  def new; end

  def create
    begin
      if current_user == nil
        flash[:notice] = 'You must sign in to create a trip'
        redirect_to '/user/trips/new'
      else
        trip = current_user.trips.create!(trip_params)
        redirect_to edit_user_trip_path(trip)
      end
    rescue ActiveRecord::RecordInvalid
      flash[:error] = errors.messages
      render new
    end
  end

  def edit
    @trip_events = Trip.find(params[:id]).trip_events
  end

  private

  def trip_params
    params.permit(:location, :start_date, :end_date)
  end

  def cuisine_params
    params.permit(:indian, :mexican, :pizza, :italian, :american)
  end

  def attraction_params
    params.permit(:music, :sports, :theater, :amusement_parks, :museums, :zoo)
  end
end
