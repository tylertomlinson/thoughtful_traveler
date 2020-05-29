require 'rails_helper'

RSpec.describe 'User Dashboard Index' do
  describe 'As a logged in user' do
    describe 'I can see dashboard' do
      before(:each) do
        @user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

        visit '/user'
      end

        it 'I can see edit profile button and it routes to correct page' do

          expect(page).to have_content("Edit Profile")

          click_button "Edit Profile"

          expect(current_path).to eq("/user/#{@user.id}/edit")
        end

        xit 'I can see new trip button and it routes to correct page' do

          expect(page).to have_content("New Trip")

          click_button

        end

        xit 'I can see upcoming trips button and it routes to correct page' do

          expect(page).to have_content("Upcoming Trips")

          click_button

        end

        xit 'I can see past trips button and it routes to correct page' do

          expect(page).to have_content("Past Trips")

          click_button
        end
      end
    end
  end
