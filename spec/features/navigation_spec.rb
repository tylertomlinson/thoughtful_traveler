require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    describe 'I see a nav bar where I can link to' do
      it 'sign in/register page' do
        visit root_path

        within 'nav' do
          click_link 'Sign In/Register'
        end

        expect(current_path).to eq(login_path)
      end
    end

    describe 'As a User' do
      before :each do
        @user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      end

      xit 'I can see I am logged in' do
        visit root_path

        expect(page).to have_content("Logged in as #{@user.name}")
      end

      xit 'the logout page' do
        visit root_path

        within 'nav' do
          click_link 'Log Out'
        end

        expect(current_path).to eq(root_path)
      end

      it 'my profile page' do
        visit root_path

        within 'nav' do
          click_link 'Home'
        end

        expect(current_path).to eq('/user')
      end

      xit 'the sign in/register does not show' do
        visit root_path

        expect(page).to_not have_link('Sign In/Register')
      end
    end
  end
end
