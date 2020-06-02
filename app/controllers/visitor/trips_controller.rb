class Visitor::TripsController < Visitor::BaseController
  def create
    redirect_to '/visitor/trips/new'
    flash[:notice] = 'You must sign in to create a trip'
  end

  def new; end
end
