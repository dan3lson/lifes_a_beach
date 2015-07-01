require 'rails_helper'

feature "user deletes an existing beach", %{
  As an authenticated user
  I want to delete a review that I wrote
  So that no one can view it
} do

  scenario "\n delete beach from its show page" do
    user = FactoryGirl.create(:user)
    beach = FactoryGirl.create(:beach, user: user)
    FactoryGirl.create(:review, beach: beach, user: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit beach_path(beach)

    click_on "Delete Review"

    expect(page).to have_content("Review deleted successfully.")
    expect(Review.count).to eq(0)
  end
end
