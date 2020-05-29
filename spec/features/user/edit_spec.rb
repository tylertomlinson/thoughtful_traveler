require "rails_helper"

RSpec.describe "As a User" do
  xit "I see a button to edit my profile" do
  end
  it "I can edit my own details" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).
    to receive(:current_user).
    and_return(user)

    visit '/user/edit'
    expect(page).to have_content("Edit User Details")

    expect(find("#user_name").value).to eq(user.name)
    expect(find("#user_email").value).to eq(user.email)

    fill_in "user[name]", with: "George Poolis"
    fill_in "user[email]", with: "new_example@example.com"
    click_on "commit"

    user.reload
    expect(user.name).to eq("George Poolis")
    expect(user.email).to eq("new_example@example.com")
  end

end
