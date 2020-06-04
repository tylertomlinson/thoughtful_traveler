class User::Trips::Past::TripsController < User::BaseController
  def index
    @trips = Trip.past_trips
  end
end
