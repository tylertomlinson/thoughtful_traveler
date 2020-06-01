require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the trips index page' do
    it 'I am redirected to the Google login page' do
      visit '/user/trips'

      expect(current_path).to eq("/login")
    end
  end
end
