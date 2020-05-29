require "rails_helper"

RSpec.describe "As a User" do
  xit "I see a button to edit my profile" do
  end
  it "I can edit my own details" do

    visit '/user/edit'
    expect(page).to have_content("Edit User Details")

    expect(".email").to have_content(user.email)
    expect(".name").to have_content(user.name)

    fill_in "email", with: "new_example@example.com"
    fill_in "name", with: "George Poolis"
    click_on "submit"

    user.reload
    expect(user.name).to eq("George Poolis")
    expect(user.email).to eq("new_example@example.com")
  end

end
