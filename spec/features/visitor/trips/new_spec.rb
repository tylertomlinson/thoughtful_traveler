require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I create a new trip from the welcome page' do
    it 'I see a form to create a new trip' do

      visit '/'

      click_on 'Create Trip'

      expect(current_path).to eq("/user/trips/new")

      expect(page).to have_content('Trip Preferences')
      save_and_open_page
      expect(page).to have_content('Log in with Google')

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
      expect(current_path).to eq("/user/trips/new")
        expect(page).to have_content('You must log in to create a trip')
    end
  end
end
