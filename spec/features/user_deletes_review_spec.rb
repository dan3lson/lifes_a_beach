require 'rails_helper'

feature "user deletes an existing beach", %{
  As an authenticated user
  I want to delete a review that I wrote
  So that no one can view it
} do

  scenario "\n delete beach from its show page" do
    review = FactoryGirl.create(:review)
    beach = review.beach
    user = beach.user

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit beach_path(beach)

    click_on "Delete Review"

    expect(page).to have_content("Review deleted successfully.")
    expect(Review.count).to eq(0)
  end

  scenario "user attempts to delete someone else's review" do
    review = FactoryGirl.create(:review)
    beach = review.beach
    user2 = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password

    click_button 'Log in'

    click_link beach.name

    expect(page.has_selector?('form')).to be(false)
  end
end
