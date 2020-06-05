class User::Trips::Upcoming::TripsController < User::BaseController
  def index
    @trips = Trip.upcoming_trips
  end
end
