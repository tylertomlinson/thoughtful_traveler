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
      if current_user
        visitor_redirect_trip_edit
      else
        sign_in_to_create
      end
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

  def cuisine_params
    params.permit(:indian, :mexican, :pizza, :italian, :american)
  end

  def attraction_params
    params.permit(:music, :sports, :theater, :amusement_parks, :museums, :zoo)
  end

  def visitor_redirect_trip_edit
    trip = current_user.trips.create!(trip_params)
    redirect_to edit_user_trip_path(trip)
  end

  def sign_in_to_create
    flash[:notice] = 'You must sign in to create a trip'
    redirect_to '/user/trips/new'
  end
end
