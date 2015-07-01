require 'rails_helper'

feature 'user edits a review they created', %{
  As an authenticated user
  I want to update a review that I wrote
  So that I can correct errors or provide new information
} do

  describe 'user edits review' do
    scenario "all input fields are valid" do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = beach.user

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      visit edit_beach_review_path(beach, review)

      select 'Good - 4', from: 'Rating'
      fill_in "Description", with: "Da best beach ever"
      click_button "Submit"

      expect(page).to have_content("4")
      expect(page).to have_content("Da best beach ever")
    end

    scenario "all input fields are invalid" do
      review = FactoryGirl.create(:review)
      beach = review.beach
      user = beach.user

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      visit edit_beach_review_path(beach, review)

      select '', from: 'Rating'
      fill_in "Description", with: "Da best beach ever"
      click_button "Submit"

      expect(page).to_not have_content("Review updated successfully")
      expect(page).to have_content("Review not updated successfully")
      expect(page).to have_content("can\'t be blank")
    end
  end
end
