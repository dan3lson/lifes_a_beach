require 'rails_helper'

feature "user deletes an existing beach", %Q{
  As a user,
  I want to delete one of
  my beaches.
} do

  scenario "\n delete beach from its show page" do

    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    beach = Beach.create!(
      name: "Launch Academy",
      description: "description",
      street1: "123 Main Street",
      city: "city",
      state: "state",
      zip: "zip",
      entrance_fee: 3.33,
      picture_url: "picture_url",
      user: user
    )

    visit beach_path(beach)
    click_on "Delete Beach"
    expect(page).to have_content("Beach deleted successfully.")
    expect(Beach.count).to eq(0)
  end
end
