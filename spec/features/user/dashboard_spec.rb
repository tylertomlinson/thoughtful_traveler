require 'rails_helper'

RSpec.describe 'User Dashboard Index' do
  describe 'As a logged in user' do
    describe 'I can see dashboard' do
      before(:each) do
        @user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      end

      it 'I can see edit profile button and it routes to correct page' do
        visit '/user'

        click_link 'Edit Profile'

        expect(current_path).to eq(user_edit_path)
      end

      it 'I can see new trip button and it routes to correct page' do
        visit '/user'
        click_link 'New Trip'

        expect(current_path).to eq('/user/trips/new')
      end

      it 'I cant see upcoming trips button if there are no upcoming trips' do
        visit '/user'
        expect(page).to_not have_link('Upcoming Trips')
      end

      it 'I can see past trips button if there are upcoming trips' do
        @user.trips.create(attributes_for(:trip, :upcoming_trip))
        visit '/user'

        expect(page).to have_link('Past Trips')
      end

      it 'I cant see upcoming trips button if there are no past trips' do
        visit '/user'
        expect(page).to_not have_link('Past Trips')
      end

      it 'I can see past trips button if there are past trips' do
        @user.trips.create(attributes_for(:trip, :past_trip))
        visit '/user'

        expect(page).to have_link('Past Trips')
      end
    end
  end
end
