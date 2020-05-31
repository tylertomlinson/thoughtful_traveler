class User::TripsController < User::BaseController
  def index; end

  def new
  end

  def create
    # begin
    #   trip = Trip.create!(trip_params)
    #   redirect_to edit_user_trip_path(trip)
    # rescue ActiveRecord::RecordInvalid
    #   flash[:error] = errors.messages
    #   render new
    # end
  end

  def edit; end

  private

  def trip_params
    params.permit(:location, :start_end, :end_date)
  end

  def cuisine_params
    params.permit(:indian, :mexican, :pizza, :italian, :american)
  end

  def attration_params
    params.permit(:music, :sports, :theater, :amusement_parks, :museums, :zoo)
  end


end
