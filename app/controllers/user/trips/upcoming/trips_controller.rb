class User::Trips::Upcoming::TripsController < User::BaseController
  def index
    @trips = Trip.upcoming_trip
  end
end
