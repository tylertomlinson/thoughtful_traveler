require 'rails_helper'

RSpec.describe 'User login/logout' do
  before :each do
    @user = create(:user)
  end

  it 'can login via google' do
    # need to test google oauth
    visit '/'
    click_link 'Sign In'
    expect(current_path).to eq('/login')
  end

  it 'can logout and be redirected to welcome page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit '/user'

    click_link 'Logout'

    expect(current_path).to eq('/')
    expect(page).to have_content('You have successfully logged out!')
  end
end
