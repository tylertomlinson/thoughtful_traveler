RSpec.describe "As a user on my dashboard" do
  describe "when I click on New trip" do
    it "I can see a form to make a new trip" do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit '/user'

      click_on "New Trip"

      expect(page).to have_content("Trip Preferences")
      # save_and_open_page
      fill_in "location", with: "Denver, co"
      select_date(Date.today, from: "start_date")
      select_date(Date.tomorrow, from: "End Date")
      within ".cuisine_options" do
        check "indian"
        check "mexican"
        check "italian"
      end
      within ".attraction_options" do
        check "music"
        check "sports"
      end
      click_on "Create My Trip"

      expect(current_path).to eq(edit_trip_path(Trip.first))
    end
  end
end
