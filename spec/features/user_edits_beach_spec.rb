require 'rails_helper'

feature 'user edits a beach they created', %{
  As a signed up user
  I want to sign in
  So that I can edit a beach I created
} do

  let(:beach) { FactoryGirl.create(:beach) }

  describe 'user edits beach' do
    scenario "all input fields are valid" do
      beach
      user = beach.user

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      click_link beach.name
      click_link 'Update Beach'

      fill_in "Name", with: "new Launch Academy"
      fill_in "Description", with: "new description"
      fill_in "Street 1", with: "new 123 Main Street"
      fill_in "City", with: "new city"
      fill_in "State", with: "new state"
      fill_in "Zipcode", with: "new zip"
      fill_in "Entrance Fee", with: 33.33
      fill_in "Picture URL", with: "new picture_url"
      click_on "Update Beach"

      expect(page).to have_content("Beach updated successfully")
      expect(page).to_not have_content("error")
      expect(page).to have_content("new 123 Main Street")
      expect(page).to have_content("new city")
      expect(page).to have_content("new state")
      expect(page).to have_content("new zip")
      expect(page).to have_content("new Launch Academy")
      expect(page).to have_content(33.33)
      expect(page).to have_content("new picture_url")
      expect(page).to have_content("new description")
    end

    scenario "all input fields are invalid" do
      user = beach.user

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      click_link beach.name
      click_link 'Update Beach'

      fill_in "Name", with: ""
      fill_in "Description", with: ""
      fill_in "Street 1", with: ""
      fill_in "City", with: ""
      fill_in "State", with: ""
      fill_in "Zipcode", with: ""
      fill_in "Entrance Fee", with: nil
      fill_in "Picture URL", with: ""
      click_on "Update Beach"

      expect(page).to_not have_content("Beach updated successfully")
      expect(page).to have_content("Beach not updated successfully")
      expect(page).to have_content("error")
    end

    scenario "user attempts to edit beach they created" do
      beach
      user = beach.user

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      click_link beach.name

      expect(page).to have_content('Update Beach')
      expect(page).to have_content('Delete Beach')
    end

    scenario "user attempts to edit beach created by another user" do
      beach
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      click_link beach.name

      expect(page).to_not have_content('Update Beach')
      expect(page).to_not have_content('Delete Beach')
    end

    scenario "malicious user attempts to edit someone else's review" do
      beach
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      visit edit_beach_path(beach)

      expect(page.has_selector?('form')).to be(false)
    end
  end
end
