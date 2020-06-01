require 'rails_helper'

RSpec.describe 'As a user when i create a new trip' do
  xit 'i am redirected to a trip edit page and i can request event changes' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    trip = user.trips.create(attributes_for(:trip))
    event1 = trip.events.create(attributes_for(:event))
    event2 = trip.events.create(attributes_for(:event))

    visit edit_user_trip_path(trip)

    expect(page).to have_content('Event Confirmation')

    within '.event-list' do
      within "#event-#{event1.id}" do
        expect(find("#event-#{event1.id}-name")).to have_content(event1.name)
        expect(find("#event-#{event1.id}-genre")).to have_content(event1.genre)
        expect(page).to have_button('Pick Another')
      end
      within "#event-#{event2.id}" do
        expect(find("#event-#{event2.id}-name")).to have_content(event2.name)
        expect(find("#event-#{event2.id}-genre")).to have_content(event2.genre)

        click_button('Pick Another')

        expect(find("#event-#{event2.id}-name")).not_to have_content(event2.name)
      end
    end
    click_button('Confirm Trip')

    expect(current_path).to eq(user_trip_path(trip))
  end
end
