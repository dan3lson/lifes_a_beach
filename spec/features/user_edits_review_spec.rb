require 'rails_helper'

feature 'user edits a review they created', %{
  As an authenticated user
  I want to update a review that I wrote
  So that I can correct errors or provide new information
} do

  describe 'user edits review' do
    scenario "all input fields are valid" do
      user = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review, user: user)
      beach = review.beach

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
      click_link beach.name
      click_link 'Edit Review'

      select 'Good - 4', from: 'Rating'
      fill_in "Description", with: "Da best beach ever"
      click_button "Submit"

      expect(page).to have_content("4")
      expect(page).to have_content("Da best beach ever")
    end

    scenario "all input fields are invalid" do
      user = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review, user: user)
      beach = review.beach

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
      click_link beach.name
      click_link 'Edit Review'

      select '', from: 'Rating'
      fill_in "Description", with: "Da best beach ever"
      click_button "Submit"

      expect(page).to_not have_content("Review updated successfully")
      expect(page).to have_content("Review not updated successfully")
      expect(page).to have_content("can\'t be blank")
    end

    scenario "user attempts to edit review they created" do
      user = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review, user: user)
      beach = review.beach

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      click_link beach.name

      expect(page).to have_content('Edit Review')
      expect(page).to have_content('Delete Review')
    end

    scenario "user attempts to edit review created by another user" do
      user = FactoryGirl.create(:user)
      review = FactoryGirl.create(:review)
      beach = review.beach

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      click_link beach.name

      expect(page).to_not have_content('Edit Review')
      expect(page).to_not have_content('Delete Review')
    end

    scenario "malicious user attempts to edit someone else's review" do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user2 = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user2.email
      fill_in 'Password', with: user2.password

      click_button 'Log in'

      visit edit_beach_review_path(beach, review)

      expect(page.has_selector?('form')).to be(false)
    end
  end
end
