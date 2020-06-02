require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the visitor trips index page' do
    it 'I am redirected to the Google login page' do
      visit '/visitor/trips'

      expect(current_path).to eq('/login')
    end
  end
end
