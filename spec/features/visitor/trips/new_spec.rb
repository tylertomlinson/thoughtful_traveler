require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I create a new trip from the welcome page' do
    before(:each) do
      visit '/'

      click_on 'Create Trip'
    end

    it 'I see a form to create a new trip' do
      expect(current_path).to eq('/visitor/trips/new')

      expect(page).to have_content('Trip Preferences')
      expect(page).to have_content('Location')
      expect(page).to have_content('Start date')
      expect(page).to have_content('End date')
    end

    it 'I see a flash message to sign in when click Create Trip' do
      fill_in 'location', with: 'Denver, co'
      fill_in 'start_date', with: '2525/01/01'
      fill_in 'end_date', with: '2525/12/12'
      within '.cuisine_options' do
        check 'indian'
        check 'mexican'
        check 'italian'
      end
      within '.attraction_options' do
        check 'music'
        check 'sports'
      end

      click_on 'Create My Trip'

      expect(current_path).to eq('/visitor/trips/new')
      expect(page).to have_content('You must sign in to create a trip')
    end
  end
end
