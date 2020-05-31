require 'rails_helper'

RSpec.describe 'Past trips index' do
  describe 'As a logged in user' do
    describe 'I can see my past trips' do
      before(:each) do
        @user = create(:user)
        @place = create(:place)
        @trip1 = create(:trip, user_id: @user.id, place_id: @place.id)
        @trip2 = create(:trip, user_id: @user.id, place_id: @place.id)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      end
      it 'can access past trips index' do
        visit '/user'

        click_on 'Past Trips'
      end

      xit 'can see links to past trips' do
        visit '/user/trips'

        expect(page).to have_link('Trip 1')
        expect(page).to have_link('Trip 2')
      end

      xit 'can click past trip and be redirected to past trip show page' do
        visit '/user/trips'

        click_on 'Trip 1'

        expect(current_path).to eq("/past_trips/#{@user.id}/#{@trip1.id}")
      end
    end
  end
end
