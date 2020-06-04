require 'rails_helper'

RSpec.describe 'Past Trips Index' do
  describe 'As a logged in user' do
    describe 'On the past trips index' do
      before(:each) do
        user = create(:user)
        trip = user.trips.create(attributes_for(:trip))

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/user/trips/past/trips'
      end

      it 'I can see all past trips' do

      end
    end
  end
end
