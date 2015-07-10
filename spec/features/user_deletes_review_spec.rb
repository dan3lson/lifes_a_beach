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
    sign_in(user)

    first(:link, beach.name).click

    click_link "Delete Review"

    expect(page).to have_content("Review deleted successfully.")
    expect(Review.count).to eq(0)
  end

  scenario "user attempts to delete someone else's review" do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    beach = review.beach
    sign_in(user)

    first(:link, beach.name).click

    expect(page).to_not have_content("Delete Review")
  end
end
