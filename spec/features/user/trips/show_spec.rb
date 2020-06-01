require 'rails_helper'

RSpec.describe 'Trips show page' do
  describe 'When I visit a trip show page' do
    it 'I can see trip events, attractions, restaurants' do
      user = create(:user)
      trip = user.trips.create(attributes_for(:trip))
      event1 = trip.events.create(attributes_for(:event))

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/user/trips/#{trip.id}"

      expect(page).to have_content(event1.name)
    end
  end
end
