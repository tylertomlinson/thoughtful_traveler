class User::Trips::Past::TripsController < User::BaseController
  def index;
    @past_trips = Trip.where("end_date < ?", 2.days.ago)
  end

  def show
    binding.pry
  end
end
