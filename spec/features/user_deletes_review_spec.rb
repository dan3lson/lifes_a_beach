require 'rails_helper'

feature "user deletes an existing beach", %{
  As an authenticated user
  I want to delete a review that I wrote
  So that no one can view it
} do

  scenario "user deletes review from its show page" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user)
    beach = review.beach

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link beach.name

    click_link "Delete Review"

    expect(page).to have_content("Review deleted successfully.")
    expect(Review.count).to eq(0)
  end

  scenario "user attempts to delete someone else's review" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    beach = review.beach

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link beach.name

    expect(page).to_not have_content("Delete Review")
  end
end
